require 'tempfile'
require 'yaml'

def run(command)
  puts "Running: #{command}"
  system command
  raise "Failure! #{$?}" if $? != 0
end

def run_knife(command, node)
  run "knife solo #{command} -F #{agents_ssh_config_path} #{node} -N #{node} nodes/buildAgent.json"
end

def agents
  agents_path = File.join(Dir.pwd, "nodes", "nodes.yml")
  unless File.exists? agents_path
    puts "Can't find #{agents_path}"
    exit 1
  end
  YAML.load_file(agents_path)
end

def agents_ssh_config_path
  @agents_ssh_config_path ||= begin
      ssh_config_file = Tempfile.new('agent_ssh_config')
      agents.each do |node, attrs|
        ssh_config_file.write("Host #{node}\n")
        attrs.each do |key, value|
          ssh_config_file.write("  #{key} #{value}\n")
        end
      end
      ssh_config_file.close
      at_exit { ssh_config_file.delete }
      ssh_config_file.path
    end
end

def agent_names
  agents.map { |key, value| key }
end

agent_names.each do |node|
  namespace node do
    desc "Run knife solo prepare for #{node}"
    task :prepare do
      run_knife 'prepare', node
    end

    desc "Run knife solo cook for #{node}"
    task :cook do
      run_knife 'cook', node
    end

    desc "Run knife solo bootstrap for #{node}"
    task :bootstrap do
      run_knife 'bootstrap', node
    end
  end
end

namespace :vagrant do
  def vagrant_ssh_config_path
    @vagrant_ssh_config_paths ||= begin
        ssh_config_file = Tempfile.new('vagrant-ssh-config')
        ssh_config_file.write(`vagrant ssh-config`)
        ssh_config_file.write('  LogLevel quiet')
        ssh_config_file.close
        ssh_config_file.path
      end
  end

  def run_knife_vagrant(command)
    run "knife solo #{command} -F #{vagrant_ssh_config_path} default nodes/buildAgent.json"
  end

  desc "Start the VM for the Vagrant Utility box"
  task :up do
    run "vagrant up"
  end

  desc "Prepare the Vagrant Utility box for provisioning"
  task :prepare => [:up] do
    run_knife_vagrant 'prepare'
  end

  desc "Provision the Vagrant Utility box"
  task :cook do
    run_knife_vagrant 'cook'
  end

  desc "Bootstrap (prepare & cook) the Vagrant Utility box"
  task :bootstrap => [:up] do
    run_knife_vagrant 'bootstrap'
  end

  desc "Destroy Vagrant Utility box"
  task :destroy do
    run "vagrant destroy -f"
  end

  desc "Cleans Vagrant Utility box, creating a fresh box"
  task :clean => [:destroy, :up]
end

