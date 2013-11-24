require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "body must be present" do
    @comment = Comment.new
    assert_not @comment.valid?
    assert_includes @comment.errors[:body], "can't be blank"
  end

  test "comment must be related to a place" do
    @comment = Comment.new
    assert_not @comment.valid?
    assert_includes @comment.errors[:place], "can't be blank"
  end
  
  test "body must contain at least 5 characters" do
    @comment = Comment.new body: 'hi'
    assert_not @comment.valid?
    assert_includes @comment.errors[:body], "is too short (minimum is 5 characters)"
  end
  
  test "valid comment" do
    @user = users(:john)
    @place = places(:subway)
    @comment = Comment.new body: 'This is the comment', place: @place, author: @user
    assert @comment.valid?
    assert_empty @comment.errors[:body]
    assert_empty @comment.errors[:place]
  end
end
