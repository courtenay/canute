require 'test_helper'

class RuleTemplatesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rule_templates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rule_template" do
    assert_difference('RuleTemplate.count') do
      post :create, :rule_template => { }
    end

    assert_redirected_to rule_template_path(assigns(:rule_template))
  end

  test "should show rule_template" do
    get :show, :id => rule_templates(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => rule_templates(:one).to_param
    assert_response :success
  end

  test "should update rule_template" do
    put :update, :id => rule_templates(:one).to_param, :rule_template => { }
    assert_redirected_to rule_template_path(assigns(:rule_template))
  end

  test "should destroy rule_template" do
    assert_difference('RuleTemplate.count', -1) do
      delete :destroy, :id => rule_templates(:one).to_param
    end

    assert_redirected_to rule_templates_path
  end
end
