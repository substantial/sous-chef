require 'spec_helper'

describe SousChef::NodeHelpers do

  describe "#node?" do
    it "should consider hashes with ssh_config key as a node" do
      SousChef::NodeHelpers.node?(SousChef::Node.new({'ssh_config' => true}, {})).should be_true
    end

    it "should consider hashes with node_config key as a node" do
      SousChef::NodeHelpers.node?(SousChef::Node.new({'node_config' => true}, {})).should be_true
    end

    it "should consider Node objects as a node" do
      SousChef::NodeHelpers.node?(SousChef::Node.new('some node', {})).should be_true
    end

    it "shouldn't consider empty hashes as a node" do
      SousChef::NodeHelpers.node?({}).should be_false
    end

    it "shouldn't consider Collection objects as a node" do
      SousChef::NodeHelpers.node?(SousChef::Collection.new('some collection')).should be_false
    end
  end
end

