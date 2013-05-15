require 'test_helper'

class DrugItemsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:drug_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create drug_item" do
    assert_difference('DrugItem.count') do
      post :create, :drug_item => { }
    end

    assert_redirected_to drug_item_path(assigns(:drug_item))
  end

  test "should show drug_item" do
    get :show, :id => drug_items(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => drug_items(:one).to_param
    assert_response :success
  end

  test "should update drug_item" do
    put :update, :id => drug_items(:one).to_param, :drug_item => { }
    assert_redirected_to drug_item_path(assigns(:drug_item))
  end

  test "should destroy drug_item" do
    assert_difference('DrugItem.count', -1) do
      delete :destroy, :id => drug_items(:one).to_param
    end

    assert_redirected_to drug_items_path
  end
end
