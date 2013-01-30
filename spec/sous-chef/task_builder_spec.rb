require 'spec_helper'

describe SousChef::TaskBuilder do
  let(:node_collection) do
    nodes = SousChef::Collection.new("web")
    nodes['other_node'] = SousChef::Node.new("other_node", {})
    nodes
  end
  let(:node) { SousChef::Node.new("nodetastic", {}) }
  let(:collection) { { node.name => node, node_collection.name => node_collection} }
  let(:builder) { SousChef::TaskBuilder.new(collection) }

  describe "#build_namespace" do
    it "should call #build_node_task for nodes" do
      builder.should_receive(:build_node_task).twice
      builder.build_namespace(collection)
    end

    it "should call #build_namespace for each Collection" do
      builder.should_receive(:build_namespace).once
      builder.build_namespace(collection)
    end
  end
end

