## 0.5.0 (2017-03-03)

* Also targeted the `.rb` extension.

## 0.4.3

* Don't append require option if it already exist.
* Make the .rspec file if it does NOT exist.

## 0.4.2

spec/rails_helper.rb file is required to select `--require rails_helper` option.

## 0.4.1

support pre-release version of Semantic Versioning.

e.g.) X.Y.Z-pre

## 0.4.0

append `--require rails_helper` to .rspec file if rspec-rails >= 3.0.0 in Gemfile.lock.
otherwise append `--require spec_helper` to .rspec file.

thank you for the feedback, @takiy33.

## 0.3.0

Change remove rule of require 'spec_helper' from spec files.

`./spec/**/*.rb` -> `./spec/**/*_spec.rb`
