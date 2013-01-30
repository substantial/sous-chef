require 'spec_helper'

describe SousChef::NodeTaskHelpers do
  before do
    SousChef::NodeTaskHelpers.stub(:run)
  end

  describe "#run_knife" do
    it "should run knife solo command for given node" do
      node = double('node')
      node.stub(name: 'foo')
      node.stub(hostname: 'node_hostname')
      node.stub(ssh_config_path: 'ssh_config_path')
      node.stub(config: 'knife_solo_node_config')
      SousChef::NodeTaskHelpers.should_receive(:run).with("knife solo some_command -F ssh_config_path node_hostname -N foo knife_solo_node_config")
      SousChef::NodeTaskHelpers.run_knife('some_command', node)
    end
  end

  describe "#filter_tasks" do
    it "should filter for tasks that have the action" do
      tasks = %w[foo:bar:action foo:bar:baz]
      SousChef::NodeTaskHelpers.filter_tasks(tasks, 'action').should include "foo:bar:action"
    end
  end
end

