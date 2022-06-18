require 'minitest/autorun'
require "stringio"
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test 
  def setup 
    @register = CashRegister.new(0)

    @transaction1 = Transaction.new(10)
    @transaction2 = Transaction.new(50)
    @transaction3 = Transaction.new(100)
  end

  def test_accept_money
    @transaction1.amount_paid = 10
    @register.accept_money(@transaction1)
    assert_equal(10, @register.total_money)

    @transaction2.amount_paid = 50
    @register.accept_money(@transaction2)
    assert_equal(60, @register.total_money)
  end

  def test_change
    @transaction3.amount_paid = 120
    assert_equal(20, @register.change(@transaction3))
  end

  def test_give_receipt 
    item_cost = 27
    test_transaction = Transaction.new(item_cost)
    assert_output("You've paid $#{item_cost}.\n") do 
      @register.give_receipt(test_transaction)
    end

    assert_output("You've paid $50.\n") do 
      @register.give_receipt(@transaction2)
    end
  end
end 







###############

# require "stringio"

# input = StringIO.new("30")
# number = gets.chomp
# puts "The number was #{number}!"   # prints "The number was 30!"

# require "stringio"

# input = StringIO.new("Jesse\n")
# name = input.gets.chomp
# puts name # => "Jesse"