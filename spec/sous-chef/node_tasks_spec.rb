require 'spec_helper'

describe SousChef::NodeTasks do
  before do
    SousChef::NodeTasks.stub(:run)
  end

  describe "#run_knife" do
    it "should run knife solo command for given node" do
      node = double('node')
      node.stub(name: 'foo')
      node.stub(hostname: 'node_hostname')
      node.stub(ssh_config_path: 'ssh_config_path')
      node.stub(config: 'knife_solo_node_config')
      SousChef::NodeTasks.should_receive(:run).with("knife solo some_command -F ssh_config_path node_hostname -N foo knife_solo_node_config")
      SousChef::NodeTasks.run_knife('some_command', node)
    end
  end
end

