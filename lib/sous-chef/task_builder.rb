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
end

