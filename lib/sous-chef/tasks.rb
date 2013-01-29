require 'rake'

nodes = SousChef::NodeManager.new(SousChef::CONFIG_FILE).nodes
SousChef::TaskBuilder.new(nodes).build_tasks

namespace :sous_chef do
  desc "Generate nodes.yml example config"
  task :init do
    SousChef.create_config
  end
end

