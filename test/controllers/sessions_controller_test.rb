require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  def setup
    @user = users(:mike)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "successful log in" do
    get :create, { email: @user.email, password: '123456' }
    assert_equal @user.id, session[:user_id]
    assert_equal "Logged in!", flash[:notice]
    assert_redirected_to places_path
  end

  test "failed log in" do
    get :create, { email: @user.email, password: 'xxx' }
    assert_nil session[:user_id]
    assert_equal "Invalid email or password", flash[:alert]
    assert_template :new
  end

  test "log out" do
    get :destroy
    assert_redirected_to root_path
  end
end
