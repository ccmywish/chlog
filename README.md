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
$ chlog
# Generate CHANGELOG.md in your git root or do nothing if already exists

$ chlog [--sub] log      
# -> Auto determine main category(fallback Enhancements) (/ sub category) add log 

$ chlog -g [-m] [--sub]
# -> Reuse last commit log (m category / sub category)

$ chlog -n [--sub] log
# -> Add log to 'New features'/'sub categories' 

$ chlog -e [--sub] log
# -> Add log to 'Enhancements'/'sub categories' 

$ chlog -b [--sub] log
# -> Add log to 'Bug fixes'/'sub categories' 

$ chlog -s [--sub] log
# -> Add log to 'Security'/'sub categories' 

$ chlog -c [--sub] log
# -> Add log to 'Compatibility'/'sub categories' 

$ chlog -d [--sub] log
# -> Add log to 'Deprecations'/'sub categories' 

$ chlog -r version
# -> Release to version
```

<br>
