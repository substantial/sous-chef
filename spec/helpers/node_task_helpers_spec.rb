require 'spec_helper'

describe SousChef::NodeTaskHelpers do
  before do
    SousChef::NodeTaskHelpers.stub(:run)
  end

  describe "#run_knife" do
    let(:node) { double('node') }

    before do
      node.stub(name: 'foo')
      node.stub(hostname: 'node_hostname')
      node.stub(ssh_config_path: 'ssh_config_path')
      node.stub(config: 'knife_solo_node_config')
    end

    it "should run knife solo command for given node" do
      SousChef::NodeTaskHelpers.should_receive(:run).with("knife solo some_command -F ssh_config_path node_hostname -N foo knife_solo_node_config")
      SousChef::NodeTaskHelpers.run_knife('some_command', node)
    end

    it "should not specify node config for #clean command" do
      SousChef::NodeTaskHelpers.should_receive(:run).with("knife solo clean -F ssh_config_path node_hostname")
      SousChef::NodeTaskHelpers.run_knife('clean', node)
    end
  end

  describe "#filter_tasks" do
    it "should filter for tasks that have the action" do
      tasks = %w[foo:bar:action foo:bar:baz]
      SousChef::NodeTaskHelpers.filter_tasks(tasks, 'action').should include "foo:bar:action"
    end

    it "shouldn't alter the input task list" do
      tasks = %w[foo:bar:action foo:bar:baz]
      tasks_clone = tasks.clone
      SousChef::NodeTaskHelpers.filter_tasks(tasks, 'action').should include "foo:bar:action"
      tasks.should == tasks_clone
    end
  end
end

