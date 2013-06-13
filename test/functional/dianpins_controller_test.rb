require 'test_helper'

class DianpinsControllerTest < ActionController::TestCase
  setup do
    @dianpin = dianpins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dianpins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dianpin" do
    assert_difference('Dianpin.count') do
      post :create, :dianpin => @dianpin.attributes
    end

    assert_redirected_to dianpin_path(assigns(:dianpin))
  end

  test "should show dianpin" do
    get :show, :id => @dianpin.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @dianpin.to_param
    assert_response :success
  end

  test "should update dianpin" do
    put :update, :id => @dianpin.to_param, :dianpin => @dianpin.attributes
    assert_redirected_to dianpin_path(assigns(:dianpin))
  end

  test "should destroy dianpin" do
    assert_difference('Dianpin.count', -1) do
      delete :destroy, :id => @dianpin.to_param
    end

    assert_redirected_to dianpins_path
  end
end
