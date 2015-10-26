# dry_require_spec_helper [![Build Status](https://travis-ci.org/koic/dry_require_spec_helper.svg)](https://travis-ci.org/koic/dry_require_spec_helper) [![Gem Version](https://badge.fury.io/rb/dry_require_spec_helper.svg)](http://badge.fury.io/rb/dry_require_spec_helper)

DRY (Don't Repeat Yourself) of `require 'spec_helper'`.

## FEATURES

* append `--require spec_helper` to .rspec file.
* remove `require 'spec_helper'` from spec files (i.e. `./spec/**/*_spec.rb` in your current working directory) .

### A little more in detail

append `--require rails_helper` to .rspec file if rspec-rails >= 3.0.0 in Gemfile.lock.

otherwise append `--require spec_helper` to .rspec file.

## HOW TO USE

```
$ cd /path/to/dir         # recommended git repository
$ dry_require_spec_helper # *** immediate effect ***
```

## REQUIREMENTS

no requirements

## INSTALL

Add these lines to your application's Gemfile:

```
gem 'dry_require_spec_helper'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install dry_require_spec_helper
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

dry_require_spec_helper is released under the [MIT License](http://www.opensource.org/licenses/MIT).
