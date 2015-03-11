require 'test_helper'

class LoginsControllerTest < ActionController::TestCase

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get dashboard" do
    session[:developer_id] = developers(:one).id
    get :dashboard
    assert_response :success
  end

  test "should initialize session" do
    #check if session changed
    post :create, {email: "sj@dev.com", password: "password"}
    assert session[:developer_id]
    assert_redirected_to root_path
  end

  test "should destroy session" do
    #check if session changed elsewise
    # delete :destroy
    # assert_redirected_to new_login_path
  end

end
