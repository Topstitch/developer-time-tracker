require 'test_helper'

class LoginsControllerTest < ActionController::TestCase

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get dashboard" do
    get :dashboard
    assert_response :success
  end

  test "should initialize session" do
    #check if session changed
    post :create {parameters}
    assert_redirected_to root_path
  end

  test "should destroy session" do
    #check if session changed elsewise
    delete :destroy
    assert_redirected_to new_login_path
  end

end
