require 'spec_helper'

describe SousChef::Environment do
  let(:nodes) { {} }
  let(:environment) { SousChef::Environment.new('some environment', nodes) }

  describe "#initialize" do
    it "sets the name" do
      environment.name.should == 'some environment'
    end

    it "has nodes" do
      environment.nodes.should be_a Hash
    end
  end
end

