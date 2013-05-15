require 'test_helper'

class SchemeProvidersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scheme_providers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scheme_provider" do
    assert_difference('SchemeProvider.count') do
      post :create, :scheme_provider => { }
    end

    assert_redirected_to scheme_provider_path(assigns(:scheme_provider))
  end

  test "should show scheme_provider" do
    get :show, :id => scheme_providers(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => scheme_providers(:one).to_param
    assert_response :success
  end

  test "should update scheme_provider" do
    put :update, :id => scheme_providers(:one).to_param, :scheme_provider => { }
    assert_redirected_to scheme_provider_path(assigns(:scheme_provider))
  end

  test "should destroy scheme_provider" do
    assert_difference('SchemeProvider.count', -1) do
      delete :destroy, :id => scheme_providers(:one).to_param
    end

    assert_redirected_to scheme_providers_path
  end
end
