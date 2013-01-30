namespace :sous_chef do
  desc "Generate nodes.yml example config"
  task :init do
    SousChef.create_config
  end
end

