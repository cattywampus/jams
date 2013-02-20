class CommentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_commentable

  def create
    @author = current_user
    comment = @commentable.comments.new params[:comment]
    comment.author = @author

    respond_to do |format|
      if comment.save
        format.html { redirect_to :back }
      end
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    authorize! :destroy, @comment
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to :back }
    end
  end

private

  def load_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end
end
