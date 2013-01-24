
def run(command)
  puts "Running: #{command}"
  system command
  raise "Failure! #{$?}" if $? != 0
end

def run_knife(command, node)
  run "knife solo #{command} -F #{node.ssh_config_path} #{node.hostname} -N #{node.name} #{node.config}"
end

SousChef::Manager.new(File.join(Dir.pwd, "nodes", "nodes.yml")).nodes.each do |node|
  namespace node.name do
    desc "Run knife solo prepare for #{node.name}"
    task :prepare do
      run_knife 'prepare', node
    end

    desc "Run knife solo cook for #{node.name}"
    task :cook do
      run_knife 'cook', node
    end

    desc "Run knife solo bootstrap for #{node.name}"
    task :bootstrap do
      run_knife 'bootstrap', node
    end
  end
end

