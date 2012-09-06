require 'test_helper'

class ExternalAccountsControllerTest < ActionController::TestCase
  setup do
    @external_account = external_accounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:external_accounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create external_account" do
    assert_difference('ExternalAccount.count') do
      post :create, external_account: { bank: @external_account.bank, currency: @external_account.currency, number: @external_account.number, unique_code: @external_account.unique_code }
    end

    assert_redirected_to external_account_path(assigns(:external_account))
  end

  test "should show external_account" do
    get :show, id: @external_account
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @external_account
    assert_response :success
  end

  test "should update external_account" do
    put :update, id: @external_account, external_account: { bank: @external_account.bank, currency: @external_account.currency, number: @external_account.number, unique_code: @external_account.unique_code }
    assert_redirected_to external_account_path(assigns(:external_account))
  end

  test "should destroy external_account" do
    assert_difference('ExternalAccount.count', -1) do
      delete :destroy, id: @external_account
    end

    assert_redirected_to external_accounts_path
  end
end
