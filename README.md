<div align="center">

# chlog

[![Gem Version](https://badge.fury.io/rb/chlog.svg)](https://rubygems.org/gems/chlog)

```bash
gem install chlog
```

Easily maintain Changelog on the cli.

<br>

</div>


## What a good Changelog looks like?

See what [a good Changelog](./A_GOOD_CHANGELOG.md) `chlog` can help to generate all through command line without your editing.

See how `chlog` help to maintain [its own Changelog](./CHANGELOG.md).

<br>


## Why?

See why I made this project rather than use existing tool from [CHANGELOG.md](./CHANGELOG.md) `Initialize` part.

See why you should [keep a changelog](https://github.com/olivierlacan/keep-a-changelog).

<br>


## Usage

Notice:
1. You can always manually add/change info to your Changelog.
2. The log's category order is keep.

```bash
chlog (v#{Chlog::GEM_VERSION}): Help maintain the Changelog of your projects

Usage:

  chlog -g                Generate CHANGELOG.md in git root
  chlog -r <3.14>         Release version to v3.14

Add log:

  chlog <-main category> [--sub category] <log>

Main Category:

  -n    Add log to New features
  -e    Add log to Enhancements
  -b    Add log to Bug fixes
  -s    Add log to Security
  -c    Add log to Compatibility
  -d    Add log to Deprecations

```

<br>
