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

  HL = HighLine.new


  def get_changelog
    file = $Changelog_file
    if File.exists? file
      return File.read file
    else
      puts "chlog: No Changelog exists, use 'chlog -g' to generate!"
      exit
    end
  end


  def generate_changelog
    file = $Changelog_file
    if File.exists? file
      puts "chlog: Already exists Changelog (#$Changelog_file)"
    else
      File.write(file, Chlog::TEMPLATE)
      puts "chlog: Generate #$Changelog_file OK!"
    end
  end


end
