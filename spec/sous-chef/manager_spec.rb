require 'spec_helper'

describe SousChef::Manager do
  let(:manager) { SousChef::Manager.new(File.join(SPEC_ROOT, "fixtures", "some_nodes.yml")) }

  describe "#initialize" do
    it "instantiates a parser with the config file" do
      manager.parser.should be_a SousChef::Parser
    end

    it "has environments" do
      manager.envs.should be_a Hash
    end
  end
end

