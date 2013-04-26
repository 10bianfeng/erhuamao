require 'test_helper'

class BrochureTravelsControllerTest < ActionController::TestCase
  setup do
    @brochure_travel = brochure_travels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:brochure_travels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create brochure_travel" do
    assert_difference('BrochureTravel.count') do
      post :create, :brochure_travel => @brochure_travel.attributes
    end

    assert_redirected_to brochure_travel_path(assigns(:brochure_travel))
  end

  test "should show brochure_travel" do
    get :show, :id => @brochure_travel.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @brochure_travel.to_param
    assert_response :success
  end

  test "should update brochure_travel" do
    put :update, :id => @brochure_travel.to_param, :brochure_travel => @brochure_travel.attributes
    assert_redirected_to brochure_travel_path(assigns(:brochure_travel))
  end

  test "should destroy brochure_travel" do
    assert_difference('BrochureTravel.count', -1) do
      delete :destroy, :id => @brochure_travel.to_param
    end

    assert_redirected_to brochure_travels_path
  end
end
