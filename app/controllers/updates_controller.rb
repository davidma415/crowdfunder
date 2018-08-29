class UpdatesController < ApplicationController
  before_action :require_login, except: [:index, :show]

  def create
    @project = Project.find(params[:project_id])
    @backers = @project.users
    @latest_updates = @project.latest_updates(5)
    @update = Update.new
    @update.name = params[:update][:name]
    @update.description = params[:update][:description]
    @update.project_id = params[:project_id]
    @update.user_id = current_user.id
    if @update.save
      flash.now[:alert] = "Successfully added update"
      redirect_to project_url(@project)
    else
      flash.now[:alert] = "Failed to make an update."
      render 'projects/show'
    end
  end

  def edit
    @update = Update.find(params[:id])
    @project = Project.find(params[:project_id])
  end

  def update
  end

  def destroy
    @update = Update.find(params[:id])
    @update.destroy
    flash[:notice] = "You've successfully deleted an update"
    redirect_to root_url
  end
end
