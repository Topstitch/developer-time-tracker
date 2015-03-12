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
    post :create, {email: "sj@dev.com", password: "password"}
    assert session[:developer_id]
    assert_redirected_to root_path
  end

  test "should destroy session" do
    delete :destroy, {id: developers(:one).id}
    assert_equal nil, session[:developer_id]
    assert_redirected_to new_login_path
  end

end
