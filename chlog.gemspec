require 'date'
require_relative 'lib/chlog/version'

Gem::Specification.new do |s|
  s.name    = "chlog"
  s.version = Chlog::GEM_VERSION
  s.date    = Date.today.to_s
  s.summary = "Help maintain Changelog on the command line!"

  s.description = <<DESC
This command line tool `chlog` helps generate and maintain the Changelog of your projects.
DESC

  s.license  = "MIT"
  s.authors  = "Aoran Zeng"
  s.email    = "ccmywish@qq.com"
  s.homepage = "https://github.com/ccmywish/chlog"

  s.files = ['lib/chlog.rb', 'lib/chlog/version.rb']
  s.bindir = 'exe'
  s.executables = ['chlog']
  s.require_paths = ['lib']

  s.add_runtime_dependency "highline", "~> 2.0"

  s.metadata = {
    "bug_tracker_uri"   => "https://github.com/ccmywish/chlog/issues",
    "source_code_uri"   => "https://github.com/ccmywish/chlog"
  }

end
