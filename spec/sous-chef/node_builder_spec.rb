require 'spec_helper'

describe SousChef::NodeBuilder do
  let(:node_builder) { SousChef::NodeBuilder.new('someNode', {}) }

  describe "#build" do
    subject { node_builder.build}

    context "with a node hash" do
      before { node_builder.stub(node?: true) }
      it "should return an Node instance" do
        subject.should be_a SousChef::Node
      end
    end

    context "without a node" do
      before { node_builder.stub(node?: false) }
      it"should return a Collectyion instance" do
        subject.should be_a SousChef::Collection
      end
    end
  end
end

