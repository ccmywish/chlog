load './bin/chlog'

Gem::Specification.new do |s|
  s.name = "chlog"
  s.version = CHLOG_VERSION
  require 'date'
  s.date = Date.today.to_s
  
  s.summary = "chlog: help maintain Changelog"

  s.description = <<DESC
This command line tool `chlog` helps generate and maintain the Changelog of your projects.
DESC

  s.license = "MIT"

  s.authors = "ccmywish"
  s.email = "ccmywish@qq.com"
  s.homepage = "https://github.com/ccmywish/chlog"

  s.files = [
  ]

  s.executables = ["chlog"]

  s.metadata = {
    "bug_tracker_uri"   => "https://github.com/ccmywish/chlog/issues",
    "source_code_uri"   => "https://github.com/ccmywish/chlog"
  }

end