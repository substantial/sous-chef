require 'spec_helper'

describe SousChef::Manager do
  let(:manager) { SousChef::Manager.new(File.join(SPEC_ROOT, "fixtures", "some_nodes.yml")) }

  describe "#initialize" do
    it "instantiates a parser with the config file" do
      manager.parser.should be_a SousChef::Parser
    end

    it "instantiates nodes" do
      manager.nodes.should be_a Hash
    end
  end

  describe "#all" do
    it "returns node names" do
      manager.all.should =~ %w[SuperAwesomeNode OtherAwesome]
    end
  end
end

