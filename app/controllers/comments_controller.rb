class CommentsController < ApplicationController
  before_action :require_login, except: [:index, :show]

  def create
    @project = Project.find(params[:project_id])
    @backers = @project.users
    @latest_updates = @project.latest_updates(5)
    @comment = Comment.new
    @comment.title = params[:comment][:title]
    @comment.content = params[:comment][:content]
    @comment.project_id = params[:project_id]
    @comment.user_id = current_user.id
    if @comment.save
      flash.now[:alert] = "Successfully posted comment"
      redirect_to project_url(@project)
    else
      flash.now[:alert] = "Failed to make a comment."
      render 'projects/show'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @project = Project.find(params[:project_id])
  end

  def update
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "You've successfully deleted a comment"
    redirect_to root_url
  end

end
