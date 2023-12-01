# frozen_string_literal: true

require_relative '../test_helper'

class ActiveYamlTest < Minitest::Test
  def setup
    @test_data = ActiveYaml.create('.examples/example.yaml')
    @test_empty_data = ActiveYaml.create('.examples/empty.yaml')
  end

  # rubocop:disable Naming/VariableNumber
  def test_call_chain
    result_1 = @test_data.yaml.kek.lol
    assert_equal result_1, 'text'

    result_2 = @test_data.yaml.kek.users.first
    assert_equal result_2, '1'
  end
  # rubocop:enable Naming/VariableNumber

  def test_incomplete_call
    result = @test_data.yaml.kek

    assert_equal result.is_a?(ActiveYaml::YamlHash), true
  end

  def test_empty_file
    assert_equal @test_empty_data.is_a?(ActiveYaml::YamlHash), true
  end
end
