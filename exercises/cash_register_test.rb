require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(1000)
    @transaction = Transaction.new(100)
  end
  
  def test_accept_money
    @transaction.amount_paid = 20
    assert_equal(20, @transaction.amount_paid)
    assert_equal(1020, @register.accept_money(@transaction))
    assert_equal(1020, @register.total_money)
  end
  
  def test_change
    @transaction.amount_paid = 100
    assert_equal(0, @register.change(@transaction))
    
    @transaction.amount_paid = 150
    assert_equal(50, @register.change(@transaction))
  end
  
  def test_receipt
    assert_output("You've paid $100.\n") { @register.give_receipt(@transaction) }
  end
  
  def test_prompt_for_payment
    input = StringIO.new('130\n')
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output: output)
    assert_equal(130, @transaction.amount_paid)
  end
  
  def test_prompt_for_payment_error
    skip
    input = StringIO.new('30\n')
    @transaction.prompt_for_payment(input: input)
    assert_output('That is not the correct amount.
      Please make sure to pay the full cost.\n') do
             @transaction.prompt_for_payment(input: input)
           end
  end
end