# encoding: utf-8

$:.push File.expand_path('../lib', __FILE__)

require 'dry_require_spec_helper/version'

Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = 'dry_require_spec_helper'
  s.summary = "DRY (Don't Repeat Yourself) of require 'spec_helper'."
  s.description = "DRY (Don't Repeat Yourself) of require 'spec_helper'."

  s.version = DryRequireSpecHelper::VERSION

  s.license = 'MIT'

  s.authors = ['Koichi ITO']
  s.email = 'koic.ito@gmail.com'
  s.homepage = 'http://github.com/koic/dry_require_spec_helper'

  s.files = Dir[
    'bin/dry_require_spec_helper',
    'lib/**/*',
    'LICENSE',
    'README.md'
  ]
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 2.0.0'
  s.license = 'MIT'
  s.executables = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
end
