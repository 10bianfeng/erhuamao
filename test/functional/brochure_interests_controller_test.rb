# -*- encoding : utf-8 -*-
require 'test_helper'

class BrochureInterestsControllerTest < ActionController::TestCase
  setup do
    @brochure_interest = brochure_interests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:brochure_interests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create brochure_interest" do
    assert_difference('BrochureInterest.count') do
      post :create, :brochure_interest => @brochure_interest.attributes
    end

    assert_redirected_to brochure_interest_path(assigns(:brochure_interest))
  end

  test "should show brochure_interest" do
    get :show, :id => @brochure_interest.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @brochure_interest.to_param
    assert_response :success
  end

  test "should update brochure_interest" do
    put :update, :id => @brochure_interest.to_param, :brochure_interest => @brochure_interest.attributes
    assert_redirected_to brochure_interest_path(assigns(:brochure_interest))
  end

  test "should destroy brochure_interest" do
    assert_difference('BrochureInterest.count', -1) do
      delete :destroy, :id => @brochure_interest.to_param
    end

    assert_redirected_to brochure_interests_path
  end
end
