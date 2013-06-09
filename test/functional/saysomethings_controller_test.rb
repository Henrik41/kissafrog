require 'test_helper'

class SaysomethingsControllerTest < ActionController::TestCase
  setup do
    @saysomething = saysomethings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:saysomethings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create saysomething" do
    assert_difference('Saysomething.count') do
      post :create, saysomething: { headlines: @saysomething.headlines, interests: @saysomething.interests, say: @saysomething.say, user_id: @saysomething.user_id }
    end

    assert_redirected_to saysomething_path(assigns(:saysomething))
  end

  test "should show saysomething" do
    get :show, id: @saysomething
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @saysomething
    assert_response :success
  end

  test "should update saysomething" do
    put :update, id: @saysomething, saysomething: { headlines: @saysomething.headlines, interests: @saysomething.interests, say: @saysomething.say, user_id: @saysomething.user_id }
    assert_redirected_to saysomething_path(assigns(:saysomething))
  end

  test "should destroy saysomething" do
    assert_difference('Saysomething.count', -1) do
      delete :destroy, id: @saysomething
    end

    assert_redirected_to saysomethings_path
  end
end
