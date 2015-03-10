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

  test "should create login" do
    assert_difference('Login.count') do
      post :create
    end
    assert_redirected_to root_path
  end

  test "should destroy login" do
    assert_difference('Logins.count', -1) do
      delete :destroy
    end
    assert_redirected_to new_login_path
  end

end
