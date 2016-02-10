class Admin::CommentsController < Admin::ApplicationController
  
  def index
  	if params[:search].present?
  		@comments = Comment.matching_fullname_or_message(params[:search]).page params[:page]
  	else
  		@comments = Comment.where(status: to_bool(params[:status])).page params[:page]
  	end
  end

  def update
     @comment  = Comment.find(params[:id])
     #byebug
     if @comment.update(status: params[:status])
      redirect_to :back, notice: 'Comment was successfully updated'
     else
       redirect_to :back, notice: 'There was a problem when updating comment'
     end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy 
    redirect_to :back, notice: 'Comment was successfully deleted'
  end
end
