require 'test_helper'

class PayTypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pay_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pay_type" do
    assert_difference('PayType.count') do
      post :create, :pay_type => { }
    end

    assert_redirected_to pay_type_path(assigns(:pay_type))
  end

  test "should show pay_type" do
    get :show, :id => pay_types(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => pay_types(:one).to_param
    assert_response :success
  end

  test "should update pay_type" do
    put :update, :id => pay_types(:one).to_param, :pay_type => { }
    assert_redirected_to pay_type_path(assigns(:pay_type))
  end

  test "should destroy pay_type" do
    assert_difference('PayType.count', -1) do
      delete :destroy, :id => pay_types(:one).to_param
    end

    assert_redirected_to pay_types_path
  end
end
