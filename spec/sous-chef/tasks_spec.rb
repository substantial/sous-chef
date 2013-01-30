require 'spec_helper'

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
end

