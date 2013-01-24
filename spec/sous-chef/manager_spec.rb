require 'spec_helper'

describe SousChef::Manager do
  let(:manager) { SousChef::Manager.new('some config file') }

  describe "#initialize" do
    it "instantiates a parser with the config file" do
      manager.parser.should be_a SousChef::Parser
    end

    it "instantiates nodes" do
      manager.nodes.should be_a Array
    end
  end
end

