# frozen_string_literal: true

require_relative '../../test_helper'

class SomeUser < ActiveYaml::BaseModel
  yaml 'test/examples/example.yaml'

  def some_method
    start.kek.lol
  end
end

module ActiveYaml
  class BaseModelTest < Minitest::Test
    def setup
      @user = SomeUser.new
    end

    # rubocop:disable Naming/VariableNumber
    def test_call_chain
      result_1 = @user.start.kek.lol

      assert_equal 'text', result_1

      result_2 = @user.start.kek.users.first

      assert_equal 'Kirill', result_2

      assert_kind_of Array, @user.start.kek.users
    end
    # rubocop:enable Naming/VariableNumber

    def test_some_method
      assert_equal 'text', @user.some_method
    end

    def test_incomplete_call
      result = @user.start.kek

      assert_kind_of ActiveYaml::YamlHash, result
    end

    def test_yaml_data
      expect_hash = { 'start' => { 'kek' => { 'lol' => 'text', 'cheburek' => 'cheburek',
                                              'users' => %w[Kirill Ekaterina] } } }

      assert_equal @user.yaml_data, expect_hash
    end
  end
end
