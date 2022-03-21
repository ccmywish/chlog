# SDD


## Data

###  Who use what changelog?

#### Rubocop

They use `rake` as a self changelog generator.

The categories they use only have three(with order):
1. New features
2. Bug fixes
3. Changes

<br>

#### RSpec

- https://github.com/rspec/rspec-core/blob/main/Changelog.md

They use `Deprecations` rather than our `Deprecated`, I'll use this in v1.2 and v1.2+

<br>

<hr>

#### TruffleRuby

- https://github.com/oracle/truffleruby/blob/master/CHANGELOG.md

1. New features
2. Bug fixes
3. Compatibility
4. Performance
5. Security
6. Changes

<br>

#### Elixir

- https://github.com/elixir-lang/elixir/blob/main/CHANGELOG.md

a bit ugly changelog, but they classified them with every sub software

```markdown
## v1.14.0-dev

### 1. Enhancements

#### EEx

  * [EEx] Support multi-line comments to EEx via `<%!-- --%>`
  * [EEx] Add `EEx.tokenize/2`
```

<br>

#### Crystal

- https://github.com/crystal-lang/crystal/blob/master/CHANGELOG.md

They seem use a wrong hierarchy of markdown, every release is a `#` (the First heading)


<br>

## User interface
