class UpdatesController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    @update = Update.new
    @update.name = params[:update][:name]
    @update.description = params[:update][:description]
    @update.project_id = params[:project_id]
    @update.user_id = current_user.id
    if @update.save
      flash.now[:alert] = ["Successfully added update"]
      redirect_to root_url
    else
      flash.now[:alert] = ["Failed to make an update."]
      render projects_path
    end
  end
  def edit
    @update = Update.find(params[:id])
    @project = Product.find(params[:project_id])
  end
  def update
  end
  def destroy
    @update = Update.find(params[:id])
    @update.destroy
    flash[:notice] = "You've successfully deleted an update"
    redirect_to "/projects"
  end
end
