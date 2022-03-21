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

To see what [a good Changelog](./A_GOOD_CHANGELOG.md) `chlog` can help to generate all through command line without your editing.

And you can see how `chlog` help to maintain this `chlog`'s [own Changelog](./CHANGELOG.md).

<br>


## Why?

See why you should [keep a changelog](https://github.com/olivierlacan/keep-a-changelog).

And to see why I made this project rather than use existing tool from [CHANGELOG.md](./CHANGELOG.md)'s `Initialize` part.

<br>


## Usage

You can always manually add more info to your Changelog, as `chlog` is only a helper. see [CHANGELOG.md](./CHANGELOG.md) for example.

Notice: The log's category order is keep.

```bash
$ chlog
# Generate CHANGELOG.md or do nothing if already exists

$ chlog log
# -> Add log according to case or to Enhancements by default

$ chlog -n log
# -> Add log to 'New features'

$ chlog -e log
# -> Add log to 'Enhancements'

$ chlog -b log
# -> Add log to 'Bug fixes'

$ chlog -s log
# -> Add log to 'Security'

$ chlog -c log
# -> Add log to 'Compatibility'

$ chlog -d log
# -> Add log to 'Deprecations'

$ chlog -r version
# -> Release to version
```

<br>

