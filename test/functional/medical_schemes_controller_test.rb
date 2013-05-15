require 'test_helper'

class MedicalSchemesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medical_schemes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medical_scheme" do
    assert_difference('MedicalScheme.count') do
      post :create, :medical_scheme => { }
    end

    assert_redirected_to medical_scheme_path(assigns(:medical_scheme))
  end

  test "should show medical_scheme" do
    get :show, :id => medical_schemes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => medical_schemes(:one).to_param
    assert_response :success
  end

  test "should update medical_scheme" do
    put :update, :id => medical_schemes(:one).to_param, :medical_scheme => { }
    assert_redirected_to medical_scheme_path(assigns(:medical_scheme))
  end

  test "should destroy medical_scheme" do
    assert_difference('MedicalScheme.count', -1) do
      delete :destroy, :id => medical_schemes(:one).to_param
    end

    assert_redirected_to medical_schemes_path
  end
end
