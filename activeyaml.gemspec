# frozen_string_literal: true

require_relative 'lib/active_yaml/version'

Gem::Specification.new do |s|
  s.name        = 'activeyaml'
  s.version     = ActiveYaml::VERSION
  s.summary     = 'yaml object-relational mapping'
  s.description = 'framework for convenient and complete work with Yaml files'
  s.authors     = ['Kirill Leonov']
  s.email       = 'leonov7632@gmail.com'
  s.files       = Dir.glob('lib/**/*')
  s.homepage    = 'https://github.com/leonovk/activeyaml'
  s.license     = 'MIT'
  s.required_ruby_version = '>= 3.0'
  s.metadata['homepage_uri'] = s.homepage
  s.metadata['source_code_uri'] = s.homepage
  s.metadata['documentation_uri'] = s.homepage
end
