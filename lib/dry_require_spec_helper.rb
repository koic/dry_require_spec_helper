require 'dry_require_spec_helper/core'

module DryRequireSpecHelper
  def dry(target_path)
    core = Core.new(target_path)

    core.append_require_options
    core.remove_require_spec_helper
  end

  module_function :dry
end
