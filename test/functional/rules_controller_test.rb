require 'test_helper'

class RulesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rule" do
    assert_difference('Rule.count') do
      post :create, :rule => { }
    end

    assert_redirected_to rule_path(assigns(:rule))
  end

  test "should show rule" do
    get :show, :id => rules(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => rules(:one).to_param
    assert_response :success
  end

  test "should update rule" do
    put :update, :id => rules(:one).to_param, :rule => { }
    assert_redirected_to rule_path(assigns(:rule))
  end

  test "should destroy rule" do
    assert_difference('Rule.count', -1) do
      delete :destroy, :id => rules(:one).to_param
    end

    assert_redirected_to rules_path
  end
end
