require 'test_helper'

class DevelopersControllerTest < ActionController::TestCase
  setup do
    @developer = developers(:one)
    session[:developer_id] = @developer.id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:developers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create developer" do
    assert_difference('Developer.count') do
      post :create, developer: { name: "Johnny Justice", email: "johnny@dev.com", password: "password"}
    end
    assert_redirected_to developers_path
  end

  test "should get edit" do
    get :edit, id: @developer
    assert_response :success
  end

  test "should update developer" do
    patch :update, id: @developer, developer: { name: "John B. Justice", email: "johnny@dev.com", password: "password"}
    assert_redirected_to developers_path
  end

  test "should destroy developer" do
    assert_difference('Developer.count', -1) do
      delete :destroy, id: @developer
    end
    assert_redirected_to developers_path
  end

end
