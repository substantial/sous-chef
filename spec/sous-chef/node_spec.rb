require 'spec_helper'

describe SousChef::Node do
  let(:node_hash) { {
    "node_config" => "some/path/to/node/config",
    "ssh_config" => { "HostName" => "Some IP" }
  }}

  subject { SousChef::Node.new('SuperAwesomeNode', node_hash) }

  describe "#name" do
    its(:name) { should == "SuperAwesomeNode" }
  end

  describe "#config" do
    its(:config) { should == 'some/path/to/node/config' }
  end

  describe "#hostname" do
    its(:hostname) { should == 'SuperAwesomeNode' }

    context "with host in ssh_config" do
      before { node_hash["ssh_config"]["Host"] = 'Some other name'}
      its(:hostname) { should == 'Some other name'}
    end
  end

  describe "#ssh_config" do
    it "returns ssh_config" do
      subject.ssh_config.should include "Host SuperAwesomeNode\n"
      subject.ssh_config.should include "HostName Some IP\n"
    end
  end
end

