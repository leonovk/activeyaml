# frozen_string_literal: true

require 'rake/testtask'
require_relative 'lib/active_yaml/version'

# run rake test MINITEST_REPORTER=HtmlReporter
# for generate html reports
Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end

task :build_and_push do
  puts "build activeyaml #{ActiveYaml::VERSION}"
  system 'gem build activeyaml.gemspec'
  file_name = "activeyaml-#{ActiveYaml::VERSION}.gem"
  system "gem push #{file_name} -k rubygems"
  File.delete(file_name)
  puts 'done'
end
