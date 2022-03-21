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

## What a good Changelog looks like?

```markdown
# Changelog

## [Unreleased](#) (2022-03-20)

**New features:**

- These should be the features newly added, e.g. a feature branch merged in. Old features enhancements and bug fix should not be placed here. So this means huge feature changes.

**Enhancements:**

- Old features Enhanced, sometimes a little feature change.
- Stability Enhanced
- Maintainability Enhanced
- Portability

**Bug fixes:**

- Fix ....

**Deprecations:**

- Notice user, developer breaking changes

<br>

## [Initialize](#) (2022-03-18)

  Project vision, plan before coding

<br>

<hr>

```

<br>
