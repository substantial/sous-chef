require 'spec_helper'

describe SousChef::NodeHelpers do
  include SousChef::NodeHelpers

  describe "#node?" do
    let(:settings_hash) { {} }

    subject { node?(settings_hash) }

    context "with hash containing ssh_config" do
      before { settings_hash['ssh_config'] = true }
      it { subject.should be_true }
    end

    context "with hash containing node_config" do
      before { settings_hash['node_config'] = true }
      it { should be_true }
    end

    context "with actual node" do
      subject { node?(SousChef::Node.new('some node', {})) }
      it { should be_true }
    end

    context "with empty hash" do
      it { should be_false }
    end
  end
end

