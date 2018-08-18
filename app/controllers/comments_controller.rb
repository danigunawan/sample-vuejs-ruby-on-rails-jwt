class CommentsController < ApplicationController
  skip_before_action :authenticate_request, only: %i[]
  
  def create
    logger.debug "data user #{@current_user.attributes.inspect}"
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: {
        message: 'Comment create successfully',
        code: 'success'
      }
    else
      render json: {
        message: 'Failed to comment',
        code: 'failed'
      }
    end
  end
  
  private
  def comment_params
      params.permit(:body, :user_id, :video_id)
  end
  
end
