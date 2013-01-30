require 'spec_helper'

describe SousChef::NodeBuilder do
  let(:node_builder) { SousChef::NodeBuilder.new('someNode', {}) }

  describe "#build" do
    subject { node_builder.build}

    it "should return an Node instance" do
      node_builder.stub(node?: true)
      subject.should be_a SousChef::Node
    end

    it"should return a Collectyion instance" do
      node_builder.stub(node?: false)
      subject.should be_a SousChef::Collection
    end
  end
end

