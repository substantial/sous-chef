require 'spec_helper'

def get_task(task_list, task_name)
  task_list.select {|task| task.name == task_name}.first
end

describe "sous_chef.rake" do
  before(:all) do
    @rake = Rake::Application.new
    Rake.application = @rake
    @rake.rake_require "lib/tasks/sous_chef", [File.expand_path(File.join(SPEC_ROOT, '..'))]
  end

  it "should have sous_chef:init rake task" do
    rake_tasks = @rake.tasks.map(&:name)
    rake_tasks.should include "sous_chef:init"
  end

  describe "#sous_chef:init" do
    it "should call #SousChef.create_config" do
      SousChef.should_receive(:create_config)
      @rake['sous_chef:init'].invoke
    end
  end
end

describe "generated node tasks" do
  let(:rake_tasks) { @rake.tasks.map(&:name) }

  before(:all) do
    SousChef.stub(config_file_location: File.join(SPEC_ROOT, "support", "fixtures", "some_nodes.yml"))
    @rake = Rake::Application.new
    Rake.application = @rake
    @rake.rake_require "lib/tasks/node_tasks", [File.expand_path(File.join(SPEC_ROOT, '..'))]
  end

  it "should build tasks for nodes in nodes.yml" do
    rake_tasks.should include "vagrant:bootstrap"
  end

  it "should namespace nodes tasks" do
    rake_tasks.should include "production:web:OtherAwesome:bootstrap"
  end

  it "should have #all task for namespaces" do
    rake_tasks.should include "production:all:cook"
    rake_tasks.should include "production:web:all:prepare"
  end

  describe "generated namespace#all tasks" do
    let(:multitasks) { multitasks = @rake.tasks.keep_if{ |task| task.is_a? Rake::MultiTask } }

    %w[prepare cook clean bootstrap].each do |command|
      it "should include all node tasks for #{command}" do
        production_prepare_multitask = get_task(multitasks, "production:web:all:#{command}")
        production_prepare_multitask.prerequisites.should =~ ["production:web:OtherAwesome:#{command}"]
      end
    end
  end
end

