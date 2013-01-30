class SousChef::TaskBuilder
  include SousChef::NodeTasks
  include SousChef::NodeHelpers

  def initialize(nodes)
    @nodes = nodes
  end

  def build_tasks
    build_namespace(@nodes)
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

