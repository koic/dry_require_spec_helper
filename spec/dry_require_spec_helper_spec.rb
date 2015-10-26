require 'fileutils'

describe DryRequireSpecHelper do
  let(:temporary_testing_path) { 'tmp' }

  before do
    FileUtils.rm_r(temporary_testing_path) if Dir.exist?(temporary_testing_path)

    FileUtils.cp_r('spec/fixtures', temporary_testing_path)
  end

  describe '.dry' do
    let(:dried_dot_rspec) { File.read("#{temporary_testing_path}/#{template_dirname}/.rspec") }
    let(:dried_spec_file) { File.read("#{temporary_testing_path}/#{template_dirname}/spec/foo_spec.rb") }

    before do
      DryRequireSpecHelper.dry("#{temporary_testing_path}/#{template_dirname}")
    end

    context 'without rails_helper.rb' do
      let(:template_dirname) { 'without_rails_helper_rb' }

      describe '.rspec' do
        specify { expect(dried_dot_rspec).to eq "--color\n--require spec_helper\n" }
      end

      describe 'spec/foo_spec.rb' do
        specify { expect(dried_spec_file).to eq '' }
      end
    end

    context '.rspec file does not exist' do
      let(:template_dirname) { 'dot_rspec_file_does_not_exist' }

      describe '.rspec' do
        specify { expect(dried_dot_rspec).to eq "--require spec_helper\n" }
      end

      describe 'spec/foo_spec.rb' do
        specify { expect(dried_spec_file).to eq '' }
      end
    end

    context 'with rails_helper.rb' do
      let(:template_dirname) { 'with_rails_helper_rb' }

      describe '.rspec' do
        specify { expect(dried_dot_rspec).to eq "--color\n--require rails_helper\n" }
      end

      describe 'spec/foo_spec.rb' do
        specify { expect(dried_spec_file).to eq '' }
      end
    end
  end
end
