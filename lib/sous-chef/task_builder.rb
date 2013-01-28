class SousChef::TaskBuilder
  include SousChef::NodeTasks
  include SousChef::NodeHelpers

  def initialize(nodes)
    @nodes = nodes
  end

  def build_tasks
    @nodes.each do |name, collection|
      if node?(collection)
        build_node_task(collection)
      else
        SousChef::TaskBuilder.new(collection).build_tasks
      end
    end
    #   namespace :all do
    #     desc "Run knife solo prepare for all #{environment_name} nodes"
    #     multitask :prepare => build_task_list(environment_name, env.nodes.keys, "prepare")

    #     desc "Run knife solo cook for all #{environment_name} nodes"
    #     multitask :cook => build_task_list(environment_name, env.nodes.keys, "cook")

    #     desc "Run knife solo bootstrap for all #{environment_name} nodes"
    #     multitask :bootstrap => build_task_list(environment_name, env.nodes.keys, "bootstrap")
    #   end

    #   env.nodes.each do |node_name, node|
    #     build_node_task(node)
    #   end
  end
end

