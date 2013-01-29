require 'spec_helper'

describe "Generated Rake Tasks" do

  describe "sous_chef tasks" do
    it "should include an init task" do
      rake_tasks = Rake.application.tasks.map(&:name)
      rake_tasks.should include "sous_chef:init"
    end

    describe "#sous_chef:init" do
      it "should create a nodes.yml config" do
        SousChef.should_receive(:create_config)
        Rake.application['sous_chef:init'].invoke
      end
    end
  end

end

