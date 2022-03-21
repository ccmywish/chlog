# SDD


## Data

Based on the following analysis, I decided to use theses categories (in order) for classification.

1. New features
2. Enhancements
3. Bug fixes
4. Security
5. Compatibility
6. Deprecations

And user can specify the `sub category` as the user request, so the above part is called `main category`.

<br>

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

According to [Data Design](#Data), I'll make this available to users.

```shell
chlog -x loginfo
```
Here, `x` can represent any categories word(one of the main categories)'s first char. 

```shell
chlog -x --sub lginfo
```
Here, `--sub` can represent any sub categories wordr as the user specify. This's learned from Elixir's changelog, they use `--sub` as their software components. 

<br>

## Algorithm

Implement this is really tedious if you just insert / delete setences in the Changelog. The difficult part of this program is to keep the `main category` order. That is, if we change the order, how much should we change the source code?

Here is the psuedocode as Ruby:
```ruby
lines    # The Changelog's lines array  

lines[2] # The "Unreleased version", will not change forever

nvi = next_version_index() # The version next Unreleased

lines[4...nvi] # Is the real part of our program should focus
```

Let's see the order, again
1. New features
2. Enhancements
3. Bug fixes
4. Security
5. Compatibility
6. Deprecations


The algorithm deployed in our program is to make `add_to_a_category` into three parts:
1. The first order function: `add_to_new_features`
  It only cares about the `Unreleased version`'s location

2. The first order function: `add_to_new_features`
  It only cares about the `next version`'s location

3. The middle four categories function
  If we implement 'Enhancements', we should keep it after 'New features' and before 'Bug fixes'. But to locate the new log, the category above our 'Enhancements' is not useful at all. We can only rely on the category below our 'Enhancements'. 
  
  But what if the `before` category not exists? So you depart it into two parts. See `chlog`'s function `meta_add_to_a_category` to know what I do.

