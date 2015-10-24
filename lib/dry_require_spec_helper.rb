require 'dry_require_spec_helper/core'

module DryRequireSpecHelper
  def dry(target_path)
    core = Core.new(target_path)

    unless core.valid?
      puts 'dry_require_spec_helper: .rspec: No such file or directory'

      exit 1
    end

    core.append_require_options
    core.remove_require_spec_helper
  end

  module_function :dry
end
