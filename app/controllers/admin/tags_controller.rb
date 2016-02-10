class Admin::TagsController < Admin::ApplicationController
  
  def new
  @tag = Tag.new
  @tags = Tag.all.order(id: :desc)
  end

  def create
      if tags_params[:name].empty?
         redirect_to :back, alert: 'There was a problem when creating tag'
      else
        tags_params[:name].split(',').map do |n|
        Tag.new(name: n.strip).save
        end
        redirect_to new_admin_tag_path, notice: 'tags was successfully created'        
      end      
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
     @tag  = Tag.find(params[:id])
     #byebug
     if @tag.update(tags_params)
      redirect_to new_admin_tag_path, notice: 'tag was successfully updated'
     else
      flash[:alert] = 'There was a problem when updating tag'
      render :edit 
     end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy 
    redirect_to :back, notice: 'Tag was successfully deleted'
  end

  private
  def tags_params
    params.require(:tag).permit(:id, :name)
  end
end
