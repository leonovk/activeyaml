# frozen_string_literal: true

require_relative '../test_helper'

# This test essentially covers:
# lib/active_yaml/factory_hash.rb
class ActiveYamlTest < Minitest::Test
  def setup
    @test_data = ActiveYaml.create('test/examples/example.yaml')
    @test_empty_data = ActiveYaml.create('test/examples/empty.yaml')
  end

  # rubocop:disable Naming/VariableNumber
  def test_call_chain
    result_1 = @test_data.start.kek.lol

    assert_equal 'text', result_1

    result_2 = @test_data.start.kek.users.first

    assert_equal 'Kirill', result_2

    assert_kind_of Array, @test_data.start.kek.users
  end
  # rubocop:enable Naming/VariableNumber

  def test_incomplete_call
    result = @test_data.start.kek

    assert_kind_of ActiveYaml::YamlHash, result
  end

  def test_empty_file
    assert_kind_of ActiveYaml::YamlHash, @test_empty_data
  end
end
