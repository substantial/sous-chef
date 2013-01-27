require 'spec_helper'

describe SousChef::NodeBuilder do
  let(:node_hash) { { 'ssh_config' => true } }
  let(:collection_hash) { { "someCollection" => {}, "someNode" => node_hash } }

  describe "#node?" do
    context "given a node hash" do
      subject { SousChef::NodeBuilder.new('', {}).node?(node_hash) }
      it "should be true" do
        subject.should == true
      end
    end
  end

  describe "#build" do

    context "with a node" do
      subject { SousChef::NodeBuilder.new('someNode', node_hash).build }

      it "returns a node" do
        subject.should be_a SousChef::Node
      end
    end

    context "with collection" do
      subject { SousChef::NodeBuilder.new('someNode', collection_hash).build }
      it "returns a collection" do
        subject.should be_a SousChef::Collection
      end
    end
  end
end

