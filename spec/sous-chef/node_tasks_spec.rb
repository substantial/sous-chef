require 'spec_helper'

describe SousChef::NodeTasks do

  let(:node) { double('node') }

  before do
    SousChef::NodeTasks.stub(:run)
    node.stub(name: 'foo')
  end

  describe "#run_knife" do
    before do
      node.stub(hostname: 'node_hostname')
      node.stub(ssh_config_path: 'ssh_config_path')
      node.stub(config: 'knife_solo_node_config')
    end

    it "runs knife solo command for given node" do
      SousChef::NodeTasks.should_receive(:run).with("knife solo some_command -F ssh_config_path node_hostname -N foo knife_solo_node_config")
      SousChef::NodeTasks.run_knife('some_command', node)
    end
  end
end

