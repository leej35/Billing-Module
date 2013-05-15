require 'test_helper'

class AccountSchemesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:account_schemes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create account_scheme" do
    assert_difference('AccountScheme.count') do
      post :create, :account_scheme => { }
    end

    assert_redirected_to account_scheme_path(assigns(:account_scheme))
  end

  test "should show account_scheme" do
    get :show, :id => account_schemes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => account_schemes(:one).to_param
    assert_response :success
  end

  test "should update account_scheme" do
    put :update, :id => account_schemes(:one).to_param, :account_scheme => { }
    assert_redirected_to account_scheme_path(assigns(:account_scheme))
  end

  test "should destroy account_scheme" do
    assert_difference('AccountScheme.count', -1) do
      delete :destroy, :id => account_schemes(:one).to_param
    end

    assert_redirected_to account_schemes_path
  end
end
