require 'test_helper'

class BrochureDestinationsControllerTest < ActionController::TestCase
  setup do
    @brochure_destination = brochure_destinations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:brochure_destinations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create brochure_destination" do
    assert_difference('BrochureDestination.count') do
      post :create, :brochure_destination => @brochure_destination.attributes
    end

    assert_redirected_to brochure_destination_path(assigns(:brochure_destination))
  end

  test "should show brochure_destination" do
    get :show, :id => @brochure_destination.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @brochure_destination.to_param
    assert_response :success
  end

  test "should update brochure_destination" do
    put :update, :id => @brochure_destination.to_param, :brochure_destination => @brochure_destination.attributes
    assert_redirected_to brochure_destination_path(assigns(:brochure_destination))
  end

  test "should destroy brochure_destination" do
    assert_difference('BrochureDestination.count', -1) do
      delete :destroy, :id => @brochure_destination.to_param
    end

    assert_redirected_to brochure_destinations_path
  end
end
