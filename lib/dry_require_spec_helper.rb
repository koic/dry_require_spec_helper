File.open('.rspec', 'a') {|file| file.write('--require spec_helper') }

Dir['./spec/**/*.rb'].each do |path|
  source = File.read(path)

  next unless /require +('spec_helper'|"spec_helper")\n*/ === source

  source.gsub!($&, '')

  File.open(path, 'w+') {|f| f.write(source) }
end
