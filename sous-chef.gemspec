# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = 'sous-chef'
  s.version     = "0.0.1"
  s.summary     = "Manage nodes"
  s.description = "Handles configuration and management of chef nodes"

  s.authors     = "Shaun Dern"
  s.email       = "shaun@substantail.com"

  s.rubyforge_project = "sous-chef"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "knife-solo", "~> 0.1.0"

end

