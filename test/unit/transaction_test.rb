# encoding: utf-8
require './test/test_helper'

class TransactionTest < ActiveSupport::TestCase
  fixtures :accounts, :external_accounts

  test 'una transacción es imposible entre cuentas de distinta moneda' do
    assert Transaction.between(accounts(:pesos), accounts(:dollars), 100).invalid?
  end

  test 'una transacción es posible entre dos cuentas internas' do
    assert Transaction.between(accounts(:pesos_hundred), accounts(:pesos_zero), 100).valid?
  end

  test 'una transacción es imposible entre la misma cuenta' do
    assert Transaction.between(accounts(:pesos), accounts(:pesos), 100).invalid?
  end

  test 'una transacción es imposible entre dos cuentas externas' do
    assert Transaction.between(external_accounts(:pesos_nacion), external_accounts(:pesos_frances), 100).invalid?
  end

  test 'una transacción es posible entre una cuenta interna y otra externa' do
    assert Transaction.between(accounts(:pesos), external_accounts(:pesos_nacion), 100).valid?
    assert Transaction.between(external_accounts(:pesos_nacion), accounts(:pesos), 100).valid?
  end

  test 'una transacción es imposible si alguna de las cuentas está inactiva' do
    assert Transaction.between(accounts(:pesos_inactive), external_accounts(:pesos_nacion), 100).invalid?
    assert Transaction.between(external_accounts(:pesos_inactive), accounts(:pesos_inactive), 100).invalid?
  end

  test 'el monto de una transacción es un valor positivo y no nulo' do
    assert Transaction.between(accounts(:pesos_hundred), accounts(:pesos_zero), 0).invalid?
    assert Transaction.between(accounts(:pesos_hundred), accounts(:pesos_zero), -100).invalid?
  end

  test 'la cuenta interna de origen tiene que poseer fondos suficientes para realizar una transacción' do
    assert Transaction.between(accounts(:pesos_zero), accounts(:pesos_hundred), 100).invalid?
    # Pero esto no tiene que afectar a las cuentas externas, ya que el
    # balance en estas cobra simplemente un sentido de control.
    assert Transaction.between(external_accounts(:pesos_zero), accounts(:pesos_hundred), 100).valid?
  end

  test 'una transacción "pendiente" desacredita el monto a la cuenta de origen' do
    sender_account = accounts(:pesos_hundred)
    receiver_account = accounts(:pesos_zero)
    assert sender_account.balance = 100
    assert receiver_account.balance = 0
    Transaction.between(sender_account, receiver_account, 100)
    assert sender_account.balance = 0
    assert receiver_account.balance = 0
  end

  test 'una transacción "aceptada" acredita su monto a la cuenta de destino' do
    sender_account = accounts(:pesos_hundred)
    receiver_account = accounts(:pesos_zero)
    assert sender_account.balance = 100
    assert receiver_account.balance = 0
    t = Transaction.between(sender_account, receiver_account, 100)
    t.accept!
    assert sender_account.balance = 0
    assert receiver_account.balance = 100
  end

  test 'una transacción "rechazada" reacredita su monto a la cuenta de origen' do
    sender_account = accounts(:pesos_hundred)
    receiver_account = accounts(:pesos_zero)
    assert sender_account.balance = 100
    assert receiver_account.balance = 0
    t = Transaction.between(sender_account, receiver_account, 100)
    t.reject!
    assert sender_account.balance = 100
    assert receiver_account.balance = 0
  end

  test 'el estado inicial de una transacción es "pendiente"' do
    assert Transaction.between(accounts(:pesos_hundred), accounts(:pesos_zero), 100).status == 'pending'
  end

  # TODO: La verdad que este test podría estar mejor, como intentar cambiar
  # el estado final por otro y atrapar la excepción.
  test '"aceptada" es un estado final de una transacción' do
    t = Transaction.between(accounts(:pesos_hundred), accounts(:pesos_zero), 100)
    t.accept!
    assert t.status == 'accepted'
  end
  
  test '"rechazada" es un estado final de una transacción' do
    t = Transaction.between(accounts(:pesos_hundred), accounts(:pesos_zero), 100)
    t.reject!
    assert t.status == 'rejected'
  end
end
