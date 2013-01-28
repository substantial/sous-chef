require 'spec_helper'

describe SousChef::NodeTasks do
  include SousChef::NodeTasks
  let(:node) { double('node') }
  before do
    stub(:run)
  end

  describe "#run_knife" do
    before do
      node.stub(:name).and_return('foo')
      node.stub(:hostname).and_return('node_hostname')
      node.stub(:ssh_config_path).and_return('ssh_config_path')
      node.stub(:config).and_return('knife_solo_node_config')
    end

    its "runs knife solo command for given node" do
      should_receive(:run).with("knife solo some_command -F ssh_config_path node_hostname -N foo knife_solo_node_config")
      run_knife('some_command', node)
    end
  end
end

