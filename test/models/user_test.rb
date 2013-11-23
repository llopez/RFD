require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "email must be present" do
    @user = User.new
    assert_not @user.valid?
    assert_includes @user.errors[:email], "can't be blank"
  end

  test "nickname must be present" do
    @user = User.new
    assert_not @user.valid?
    assert_includes @user.errors[:nickname], "can't be blank"
  end

  test "password must be present" do
    @user = User.new
    assert_not @user.valid?
    assert_includes @user.errors[:password], "can't be blank"
  end

  test "password_confirmation must match password" do
    @user = User.new(email: 'user@exmaple.com', nickname: 'user', password: '123456', password_confirmation: '654321')
    assert_not @user.valid?
    assert_includes @user.errors[:password_confirmation], "doesn't match Password"
  end

  test "email and nickname must be uniq" do
    mike = users(:mike)
    @user = User.new mike.attributes
    assert_not @user.valid?
    assert_includes @user.errors[:email], "has already been taken"
    assert_includes @user.errors[:nickname], "has already been taken"
  end
  
  test "valid user" do
    @user = User.new(email: 'user@exmaple.com', nickname: 'user', password: '123456', password_confirmation: '123456')
    assert @user.valid?
    assert_empty @user.errors[:email]
    assert_empty @user.errors[:nickname]
    assert_empty @user.errors[:password]
    assert_empty @user.errors[:password_confirmation]
  end
end
