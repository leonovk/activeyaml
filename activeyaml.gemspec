# frozen_string_literal: true

require_relative 'lib/active_yaml/version'

Gem::Specification.new do |s|
  s.name        = 'activeyaml'
  s.version     = ActiveYaml::VERSION
  s.summary     = 'activeyaml'
  s.description = 'activeyaml'
  s.authors     = ['Kirill Leonov']
  s.email       = 'leonov7632@gmail.com'
  s.files       = Dir.glob('lib/**/*')
  s.homepage    = 'https://github.com/leonovk/activeyaml'
  s.license     = 'MIT'
  s.required_ruby_version = '>= 3.1.0'
  s.metadata['homepage_uri'] = s.homepage
  s.metadata['source_code_uri'] = s.homepage
  s.metadata['documentation_uri'] = s.homepage
  s.add_dependency 'psych', '~> 5.1'
end
