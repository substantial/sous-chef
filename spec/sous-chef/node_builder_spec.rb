require 'spec_helper'

describe SousChef::NodeBuilder do
  include SousChef::NodeHelpers

  let(:node_builder) { SousChef::NodeBuilder.new('someNode', {}) }

  describe "#build" do
    subject { node_builder.build}

    context "with a node" do
      before { node_builder.stub(node?: true) }
      it { should be_a SousChef::Node }
    end

   context "without a node" do
      before { node_builder.stub(node?: false) }
      it { should be_a SousChef::Collection }
    end
  end
end

