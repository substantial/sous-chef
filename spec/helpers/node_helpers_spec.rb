require 'spec_helper'

describe SousChef::NodeHelpers do

  describe "#node?" do
    let(:settings_hash) { {} }

    subject { SousChef::NodeHelpers.node?(settings_hash) }

    context "with hash containing ssh_config" do
      before { settings_hash['ssh_config'] = true }
      it "should consider hashes with ssh_config key as a node" do
        subject.should be_true
      end
    end

    context "with hash containing node_config" do
      before { settings_hash['node_config'] = true }
      it "should consider hashes with node_config key as a node" do
        subject.should be_true
      end
    end

    context "with actual node" do
      subject { SousChef::NodeHelpers.node?(SousChef::Node.new('some node', {})) }
      it "should consider Node objects as a node" do
        subject.should be_true
      end
    end

    context "with empty hash" do
      it "shouldn't consider empty hashes as a node" do
        subject.should be_false
      end
    end

    context "with collection" do
      subject { SousChef::NodeHelpers.node?(SousChef::Collection.new('some collection')) }
      it "shouldn't consider Collection objects as a node" do
        subject.should be_false
      end
    end
  end
end

