require 'spec_helper'

describe SousChef::Manager do
  describe "#initialize" do
    subject { SousChef::Manager.new('some config file') }

    it "instantiates a parser with the config file" do
      subject.parser.should be_a SousChef::Parser
    end
  end
end

