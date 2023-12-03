# frozen_string_literal: true

require_relative '../../test_helper'

module ActiveYaml
  class ParserTest < Minitest::Test
    def test_parse
      expect_hash = { 'start' => { 'kek' => { 'lol' => 'text', 'cheburek' => 'cheburek',
                                              'users' => { 'first' => '1' } } } }
      result = Parser.parse('.examples/example.yaml')

      assert_equal result, expect_hash
    end
  end
end
