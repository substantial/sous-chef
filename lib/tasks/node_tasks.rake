
nodes = SousChef::NodeManager.new(SousChef.config_file_location).nodes
SousChef::TaskBuilder.new(nodes).build_tasks

