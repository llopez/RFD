require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user_attributes = {
      email: 'peter@example.com',
      nickname: 'peter',
      password: '123456',
      password_confirmation: '123456'
    }
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: @user_attributes
    end

    assert_redirected_to root_path
  end
end
