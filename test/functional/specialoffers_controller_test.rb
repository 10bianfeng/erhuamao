require 'test_helper'

class SpecialoffersControllerTest < ActionController::TestCase
  setup do
    @specialoffer = specialoffers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:specialoffers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create specialoffer" do
    assert_difference('Specialoffer.count') do
      post :create, :specialoffer => @specialoffer.attributes
    end

    assert_redirected_to specialoffer_path(assigns(:specialoffer))
  end

  test "should show specialoffer" do
    get :show, :id => @specialoffer.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @specialoffer.to_param
    assert_response :success
  end

  test "should update specialoffer" do
    put :update, :id => @specialoffer.to_param, :specialoffer => @specialoffer.attributes
    assert_redirected_to specialoffer_path(assigns(:specialoffer))
  end

  test "should destroy specialoffer" do
    assert_difference('Specialoffer.count', -1) do
      delete :destroy, :id => @specialoffer.to_param
    end

    assert_redirected_to specialoffers_path
  end
end
