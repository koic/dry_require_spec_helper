require 'pathname'

module DryRequireSpecHelper
  def dry(target_path)
    target = Pathname(target_path)

    unless File.exist?(target.join('.rspec'))
      puts 'dry_require_spec_helper: .rspec: No such file or directory'

      exit 1
    end

    helper_name = if File.exists?(target.join('spec/rails_helper.rb')) &&
      File.exist?(target.join('Gemfile.lock')) &&
      File.read(target.join('Gemfile.lock')).split("\n").detect {|gem| /rspec-rails \((\d)\.(\d)\.(\d)([0-9A-Za-z-]*)\)\z/ === gem } &&
      $1.to_i >= 3
      'rails_helper'
    else
      'spec_helper'
    end

    File.open(target.join('.rspec'), 'a') {|file| file.write("--require #{helper_name}\n") }

    Dir[target.join('./spec/**/*_spec.rb')].each do |path|
      source = File.read(path)

      next unless /require +('(spec|rails)_helper'|"(spec|rails)_helper")\n*/ === source

      source.gsub!($&, '')

      File.open(path, 'w+') {|f| f.write(source) }
    end
  end

  module_function :dry
end
