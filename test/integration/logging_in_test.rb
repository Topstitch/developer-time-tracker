require 'test_helper'

class LoggingInTest < ActionDispatch::IntegrationTest
  #developer can try to go to the dashboard, get redirected, login, create a new developer, log out, and then the new developer can log in
  setup do
    @developer = developers(:one)
  end

  test "logging in" do
    get root_path
    assert_redirected_to new_login_path
    post logins_path, {email: "sj@dev.com", password: "password"}
    assert_redirected_to root_path
    follow_redirect!
    assert_template "logins/dashboard"
    assert_select 'a#dev-index-link'
    get developers_path
    assert_template "developers/index"
    assert_select 'a#new-dev-link'
    get new_developer_path
    post developers_path, developer: {email: "johnny@dev.com", password: "goat", name: "Johnny Cade"}
    assert_redirected_to developers_path
    delete login_path(id: @developer.id)
    assert_redirected_to new_login_path
    post logins_path, {email: "johnny@dev.com", password: "goat"}
    assert_redirected_to root_path
  end
end
