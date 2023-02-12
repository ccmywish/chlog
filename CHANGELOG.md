# Changelog

## [Unreleased](#) (2023-02-12)

<br>

## [v0.8.1](#) (2023-02-12)

### Enhancements:

- Huge refactor

### Deprecations:

- Remove feature: add log sensitively
- Remove feature: auto git commit

<br>

## [v0.7.2](#) (2022-11-29)

### Enhancements:

- Check whether is git dir

<br>

## [v0.7.1](#) (2022-11-29)

### Bug fixes:

- Fix auto commit bug on windows

<br>

## [v0.7.0](#) (2022-04-15)

### Enhancements:

- Always ask user to confirm
- Try auto commit every time
- Refactor code to ask main category first when '-g'
- Use highline

<br>

## [v0.6.1](#) (2022-04-10)

### Bug fixes:

- Fix main doesn't run in rbenv, remove the main file check
  ```ruby
  __FILE__
  # => .rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/chlog-1.6.1.alpha/bin/chlog
  # 这个总是指向本文件所在地点
  $0
  # => .rbenv/versions/3.1.1/bin/chlog
  # 这个总是指向第一个被Ruby执行的脚本
  ```

<br>

## [v0.6.0](#) (2022-04-09)

### New features:

- Add main file check

### Enhancements:

- Adjust order of category determine

<br>

## [v0.5.0](#) (2022-04-06)

### Enhancements:

- Operate Changelog always in git top-level dir

<br>

## [v0.4.0](#) (2022-03-25)

### New features:

**User Interface**

  - Support chlog after your commit
  - Support sub category, such as a software component

### Enhancements:

- Remove unused option
- Update document

**Internal**

  - Refactor var name

<br>

## [v0.3.1](#) (2022-03-24)

### Enhancements:

- Always update to latest time when making a log

<br>

## [v0.3.0](#) (2022-03-21)

### New features:

- Force maintain the main categories order
- Add 'Security', 'Compatibility' category
- Add 'New features' category

### Enhancements:

- Add good documents for possible future contributors

### Deprecations:

- Use `###` rather than `**` for main category
- Use 'Deprecations' rather than 'Deprecated'

<br>

## [v0.2.0](#) (2022-03-19)

**Enhancements:**

- Not output debug info

**Deprecated:**

- Not add to Enhancements by default, but according to log's info

<br>

## [v0.1.0](#) (2022-03-18)

**Enhancements:**

- add gemspec
- add license
- add changelog using self

<br>

## [Initialize](#) (2022-03-18)

  I write this program because I don't like the existing project [github-changelog-generator](https://github.com/github-changelog-generator/github-changelog-generator). The code can't always be associated with Github, and issues links are really messy and not necessary if the project had failed and gone nowhere, but the code may still existed in someone's dir.

  So leaving the important change logs here in this file with code is good.

<br>

<hr>

This Changelog is maintained with [chlog](https://github.com/ccmywish/chlog)

