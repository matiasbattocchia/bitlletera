require './test/test_helper'

class UserTest < ActiveSupport::TestCase

  test "un nuevo usuario debe tener cuentas creadas" do
    nuevo = User.create(email: 'sarasa@email.com', password: 'password')

    assert_instance_of Account, nuevo.ars, "No tiene cuenta en ARS"
    assert_equal 'ARS', nuevo.ars.currency

    assert_instance_of Account, nuevo.btc, "No tiene cuenta en BTC"
    assert_equal 'BTC', nuevo.btc.currency

    assert_instance_of Account, nuevo.usd, "No tiene cuenta en USD"
    assert_equal 'USD', nuevo.usd.currency

    assert_equal 3, nuevo.accounts.size
  end

end
