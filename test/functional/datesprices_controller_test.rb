# -*- encoding : utf-8 -*-
require 'test_helper'

class DatespricesControllerTest < ActionController::TestCase
  setup do
    @datesprice = datesprices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:datesprices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create datesprice" do
    assert_difference('Datesprice.count') do
      post :create, :datesprice => @datesprice.attributes
    end

    assert_redirected_to datesprice_path(assigns(:datesprice))
  end

  test "should show datesprice" do
    get :show, :id => @datesprice.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @datesprice.to_param
    assert_response :success
  end

  test "should update datesprice" do
    put :update, :id => @datesprice.to_param, :datesprice => @datesprice.attributes
    assert_redirected_to datesprice_path(assigns(:datesprice))
  end

  test "should destroy datesprice" do
    assert_difference('Datesprice.count', -1) do
      delete :destroy, :id => @datesprice.to_param
    end

    assert_redirected_to datesprices_path
  end
end
