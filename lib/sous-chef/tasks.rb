require 'rake'

def run(command)
  puts "Running: #{command}"
  system command
  raise "Failure! #{$?}" if $? != 0
end

def run_knife(command, node)
  run "knife solo #{command} -F #{node.ssh_config_path} #{node.hostname} -N #{node.name} #{node.config}"
end

SousChef::Manager.new(SousChef::CONFIG_FILE).envs.each do |name, env|
  namespace name do
    env.nodes.each do |name, node|
      namespace name do
        desc "Run knife solo prepare for #{name}"
        task :prepare do
          run_knife 'prepare', node
        end

        desc "Run knife solo cook for #{name}"
        task :cook do
          run_knife 'cook', node
        end

        desc "Run knife solo bootstrap for #{name}"
        task :bootstrap do
          run_knife 'bootstrap', node
        end
      end
    end
  end
end

namespace :sous_chef do
  desc "Generate nodes.yml example config"
  task :init do
    SousChef.create_config
  end
end

