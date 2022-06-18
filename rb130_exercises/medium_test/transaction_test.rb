require 'minitest/autorun'
require 'stringio'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'transaction'

class TransactionTest < MiniTest::Test 
  def test_prompt_for_payment 
    transaction = Transaction.new(50)
    input = StringIO.new('50')
    output = StringIO.new

    assert_nil transaction.prompt_for_payment(input: input, output: output)
    assert_equal 50, transaction.amount_paid
  end 
end 

