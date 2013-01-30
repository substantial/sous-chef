class SousChef::TaskBuilder
  include SousChef::NodeTasks
  include SousChef::NodeHelpers

  def initialize(nodes)
    @nodes = nodes
  end

  def build_tasks
    build_namespace(@nodes)
    build_batch_tasks(@nodes)
  end

  def build_batch_tasks(collection)
    collection.each do |name, collection|
      next if node?(collection)
      namespace name do |ns|
        namespace :all do
          batch_tasks(name, ns.tasks)
        end
        build_batch_tasks(collection)
      end
    end
  end

  def build_namespace(collection)
    collection.each do |name, collection|
      if node?(collection)
        build_node_task(collection)
      else
        namespace name do
          build_namespace(collection)
        end
      end
    end
  end

  private

  def batch_tasks(name, tasks)
    desc "Run knife solo prepare for all #{name} nodes"
    multitask :prepare => filter_tasks(tasks, 'prepare')

    desc "Run knife solo cook for all #{name} nodes"
    multitask :cook => filter_tasks(tasks, 'cook')

    desc "Run knife solo bootstrap for all #{name} nodes"
    multitask :bootstrap => filter_tasks(tasks, 'bootstrap')
  end

  def filter_tasks(tasks, desired_task)
    tasks.map(&:name).keep_if { |task_name| task_name.include? desired_task }
  end
end

