# -*- encoding : utf-8 -*-
require 'test_helper'

class GbookingdaysControllerTest < ActionController::TestCase
  setup do
    @gbookingday = gbookingdays(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gbookingdays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gbookingday" do
    assert_difference('Gbookingday.count') do
      post :create, :gbookingday => @gbookingday.attributes
    end

    assert_redirected_to gbookingday_path(assigns(:gbookingday))
  end

  test "should show gbookingday" do
    get :show, :id => @gbookingday.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @gbookingday.to_param
    assert_response :success
  end

  test "should update gbookingday" do
    put :update, :id => @gbookingday.to_param, :gbookingday => @gbookingday.attributes
    assert_redirected_to gbookingday_path(assigns(:gbookingday))
  end

  test "should destroy gbookingday" do
    assert_difference('Gbookingday.count', -1) do
      delete :destroy, :id => @gbookingday.to_param
    end

    assert_redirected_to gbookingdays_path
  end
end
