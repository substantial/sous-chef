require 'spec_helper'

describe SousChef::NodeManager do
  let(:node_manager) { SousChef::NodeManager.new(File.join(SPEC_ROOT, "support", "fixtures", "some_nodes.yml")) }

  describe "#initialize" do
    it "instantiates a parser with the config file" do
      node_manager.parser.should be_a SousChef::Parser
    end

    it "instantiates nodes as a hash" do
      node_manager.nodes.should be_a Hash
    end
  end
end

