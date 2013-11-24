class CommentsController < ApplicationController
  def create
    @place = Place.find(params[:place_id])
    @comment = @place.comments.build(comment_params)
    @comment.author = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @place, notice: 'Comment was successfully created.' }
      else
        format.html { render 'places/show' }
      end
    end
  end

private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
