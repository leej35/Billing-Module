require 'test_helper'

class WardTypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ward_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ward_type" do
    assert_difference('WardType.count') do
      post :create, :ward_type => { }
    end

    assert_redirected_to ward_type_path(assigns(:ward_type))
  end

  test "should show ward_type" do
    get :show, :id => ward_types(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => ward_types(:one).to_param
    assert_response :success
  end

  test "should update ward_type" do
    put :update, :id => ward_types(:one).to_param, :ward_type => { }
    assert_redirected_to ward_type_path(assigns(:ward_type))
  end

  test "should destroy ward_type" do
    assert_difference('WardType.count', -1) do
      delete :destroy, :id => ward_types(:one).to_param
    end

    assert_redirected_to ward_types_path
  end
end
