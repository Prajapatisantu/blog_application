class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @commentable, notice: "Comment posted successfully."
    else
      redirect_to @commentable, alert: "Error creating comment."
    end
  end

  private

  # This will the dynamic resource for comment build
  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
