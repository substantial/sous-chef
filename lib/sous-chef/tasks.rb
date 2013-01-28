require 'rake'

SousChef::Manager.new(SousChef::CONFIG_FILE).build_tasks

namespace :sous_chef do
  desc "Generate nodes.yml example config"
  task :init do
    SousChef.create_config
  end
end

