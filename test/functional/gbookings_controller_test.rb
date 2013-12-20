# -*- encoding : utf-8 -*-
require 'test_helper'

class GbookingsControllerTest < ActionController::TestCase
  setup do
    @gbooking = gbookings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gbookings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gbooking" do
    assert_difference('Gbooking.count') do
      post :create, :gbooking => @gbooking.attributes
    end

    assert_redirected_to gbooking_path(assigns(:gbooking))
  end

  test "should show gbooking" do
    get :show, :id => @gbooking.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @gbooking.to_param
    assert_response :success
  end

  test "should update gbooking" do
    put :update, :id => @gbooking.to_param, :gbooking => @gbooking.attributes
    assert_redirected_to gbooking_path(assigns(:gbooking))
  end

  test "should destroy gbooking" do
    assert_difference('Gbooking.count', -1) do
      delete :destroy, :id => @gbooking.to_param
    end

    assert_redirected_to gbookings_path
  end
end
