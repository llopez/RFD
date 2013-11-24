require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @place = places(:subway)
    @user = users(:mike)
    login_user(@user)
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, place_id: @place.id, comment: { body: 'This is the comment' }
    end

    assert_redirected_to place_path(assigns(:place))
  end

  private
    def login_user(user)
      session[:user_id] = user.id
    end
end
