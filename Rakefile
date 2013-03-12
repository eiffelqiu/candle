# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

# temp hacking for "undefined method `sh'" error in Rake task
class Object
  alias sh system
end

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "candle"
  gem.homepage = "http://github.com/eiffelqiu/candle"
  gem.license = "MIT"
  gem.summary = %Q{Wax iOS Starter Project Generate Tools}
  gem.description = %Q{Candle is code generator for wax framework which writes iOS application in lua, it contains xcode 4 template generators}
  gem.email = "eiffelqiu@gmail.com"
  gem.authors = ["Eiffel Qiu"]
  gem.executables = ['candle']
  gem.files = %w(LICENSE.txt README.md VERSION) + Dir.glob('lib/**/*')
  # dependencies defined in Gemfile
  gem.add_dependency 'activesupport', '>= 3.2.8'  
  gem.add_dependency 'grit'
  gem.add_dependency 'i18n'
  gem.add_dependency 'hirb'
  gem.add_dependency 'cli-colorize'
  gem.add_dependency 'rdoc'
  gem.add_dependency 'yajl-ruby'  
  gem.add_dependency 'plist' 
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "candle #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
