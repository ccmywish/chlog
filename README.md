<div align="center">

# chlog

[![Gem Version](https://badge.fury.io/rb/chlog.svg)](https://rubygems.org/gems/chlog) 

```bash
gem install chlog
```

Easily maintain Changelog on the cli.

<br>

</div>


## Usage

You can always manually add more info to your Changelog, as `chlog` is only a helper. see [CHANGELOG.md](./CHANGELOG.md) for example.

```bash
$ chlog
# Generate CHANGELOG.md or do nothing if already exists

$ chlog log
# -> Add log according to case or to Enhancements by default

$ chlog -n log
# -> Add log to 'New features'

$ chlog -e log
# -> Add log to Enhancements

$ chlog -b log
# -> Add log to Bug fix

$ chlog -d log
# -> Add log to Deprecations

$ chlog -r version
# -> Release to version
```

<br>

## Why?

See why you should [keep a changelog](https://github.com/olivierlacan/keep-a-changelog).

<br>
