# -*- encoding : utf-8 -*-
require 'test_helper'

class PhotocontestsControllerTest < ActionController::TestCase
  setup do
    @photocontest = photocontests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:photocontests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create photocontest" do
    assert_difference('Photocontest.count') do
      post :create, :photocontest => @photocontest.attributes
    end

    assert_redirected_to photocontest_path(assigns(:photocontest))
  end

  test "should show photocontest" do
    get :show, :id => @photocontest.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @photocontest.to_param
    assert_response :success
  end

  test "should update photocontest" do
    put :update, :id => @photocontest.to_param, :photocontest => @photocontest.attributes
    assert_redirected_to photocontest_path(assigns(:photocontest))
  end

  test "should destroy photocontest" do
    assert_difference('Photocontest.count', -1) do
      delete :destroy, :id => @photocontest.to_param
    end

    assert_redirected_to photocontests_path
  end
end
