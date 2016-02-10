class CommentsController < ApplicationController
  def create
  	@visitor_comment = Visitor.new(visitor_params)
     if @visitor_comment.save
      redirect_to :back, notice: 'Comment was successfully created'
    else 
      flash[:alert] = 'There was a problem creating the Comment'
      render :new
    end
  end

  def visitor_params
 		params.require(:visitor).permit(:id, :fullname, :email, comments_attributes: [:message])

  end
end
