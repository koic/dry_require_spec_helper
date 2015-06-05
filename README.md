# dry-require_spec_helper

DRY (Don't Repeat Yourself) of `require 'spec_helper'`.

## FEATURES

* append `--require spec_helper` to .rspec file.
* remove `require 'spec_helper'` from spec files (i.e. `./spec/**/*.rb` in your current working directory) .

## HOW TO USE

```
> cd /path/to/dir         # recommended git repository
> dry_require_spec_helper # *** immediate effect ***
```

## REQUIREMENTS

no requirements

## INSTALL

Add these lines to your application's Gemfile:

```
gem 'dry-require_spec_helper'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install dry-require_spec_helper
```

## LICENCE

The MIT Licence

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
