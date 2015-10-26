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

    shared_examples_for 'dried world' do
      describe '.rspec' do
        specify { expect(dried_dot_rspec).to eq content_of_dried_dot_rspec }
      end

      describe 'spec/foo_spec.rb' do
        specify { expect(dried_spec_file).to eq '' }
      end
    end

    before do
      DryRequireSpecHelper.dry("#{temporary_testing_path}/#{template_dirname}")
    end

    context 'without rails_helper.rb' do
      let(:template_dirname) { 'without_rails_helper_rb' }
      let(:content_of_dried_dot_rspec) { "--color\n--require spec_helper\n" }

      it_behaves_like 'dried world'
    end

    context '.rspec file does not exist' do
      let(:template_dirname) { 'dot_rspec_file_does_not_exist' }
      let(:content_of_dried_dot_rspec) { "--require spec_helper\n" }

      it_behaves_like 'dried world'
    end

    context 'with rails_helper.rb' do
      let(:template_dirname) { 'with_rails_helper_rb' }
      let(:content_of_dried_dot_rspec) { "--color\n--require rails_helper\n" }

      it_behaves_like 'dried world'
    end
  end
end
