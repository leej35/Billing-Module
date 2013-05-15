require 'test_helper'

class AccountItemListsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:account_item_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create account_item_list" do
    assert_difference('AccountItemList.count') do
      post :create, :account_item_list => { }
    end

    assert_redirected_to account_item_list_path(assigns(:account_item_list))
  end

  test "should show account_item_list" do
    get :show, :id => account_item_lists(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => account_item_lists(:one).to_param
    assert_response :success
  end

  test "should update account_item_list" do
    put :update, :id => account_item_lists(:one).to_param, :account_item_list => { }
    assert_redirected_to account_item_list_path(assigns(:account_item_list))
  end

  test "should destroy account_item_list" do
    assert_difference('AccountItemList.count', -1) do
      delete :destroy, :id => account_item_lists(:one).to_param
    end

    assert_redirected_to account_item_lists_path
  end
end
