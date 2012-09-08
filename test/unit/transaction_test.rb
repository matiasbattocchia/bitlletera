require './test/test_helper'

class TransactionTest < ActiveSupport::TestCase

  test 'Una transacción es entre cuentas de misma moneda.' do
    assert Transaction.new(senaccount_A, account_C, 100).invalid?
    assert Transaction.new(account_A, account_B, 100).valid?
  end

  test '
end
