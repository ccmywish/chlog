# ------------------------------------------------------
# File          : chlog.rb
# Authors       : ccmywish <ccmywish@qq.com>
# Created on    : <2022-04-15>
# Last modified : <2023-02-12>
#
# chlog:
#
#   Maintain your project's Changelog on the cli.
# ------------------------------------------------------

module Chlog

  GEM_VERSION = "0.8.0"

  require 'date'
  TODAY = Date.today.to_s

  UNRELEASED_TITLE = "## [Unreleased](#) (#{TODAY})"

  TEMPLATE = <<EOT
# Changelog

#{UNRELEASED_TITLE}

<br>

## [Initialize](#) (#{TODAY})

<br>

<hr>

This Changelog is maintained with [chlog](https://github.com/ccmywish/chlog)

EOT

end


class Chlog::Logger

  attr_accessor :sub_category,  # 存储次标题
                :log,           # 存储log
                :highline       # HighLine 实例
                :changelog      # CHANGELOG.md 位置


  def initialize
    require 'highline'
    @highline = HighLine.new

    require 'open3'
    # Prevent current directory is not git directory
    Open3.popen3("git rev-parse --show-toplevel") do |i, o, err, t|
      if err.read.include?("fatal: not a git repository")
        puts "chlog: Not a git directory!" or exit(false)
      else
        @changelog = `git rev-parse --show-toplevel`.chomp + '/CHANGELOG.md'
      end
    end
  end


  def get_changelog
    file = @changelog
    if File.exist? file
      return File.read file
    else
      abort "chlog: No Changelog exists, use 'chlog -g' to generate!"
    end
  end


  def generate_changelog
    file = @changelog
    if File.exist? file
      puts "chlog: Already exists Changelog (#@changelog)" or return false
    else
      File.write(file, Chlog::TEMPLATE)
      puts "chlog: Generate #@changelog OK!" or return true
    end
  end


end
