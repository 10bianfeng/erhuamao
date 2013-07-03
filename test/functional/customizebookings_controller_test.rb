require 'test_helper'

class CustomizebookingsControllerTest < ActionController::TestCase
  setup do
    @customizebooking = customizebookings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customizebookings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customizebooking" do
    assert_difference('Customizebooking.count') do
      post :create, :customizebooking => @customizebooking.attributes
    end

    assert_redirected_to customizebooking_path(assigns(:customizebooking))
  end

  test "should show customizebooking" do
    get :show, :id => @customizebooking.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @customizebooking.to_param
    assert_response :success
  end

  test "should update customizebooking" do
    put :update, :id => @customizebooking.to_param, :customizebooking => @customizebooking.attributes
    assert_redirected_to customizebooking_path(assigns(:customizebooking))
  end

  test "should destroy customizebooking" do
    assert_difference('Customizebooking.count', -1) do
      delete :destroy, :id => @customizebooking.to_param
    end

    assert_redirected_to customizebookings_path
  end
end
