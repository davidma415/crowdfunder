class ProjectsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @projects = Project.all
    @projects = @projects.order(:end_date)
  end

  def show
    @project = Project.find(params[:id])
    @pledges = @project.pledges
    @total_pledges = @project.total_pledges
    @backers = @project.users
    @update = Update.new
    @comment = Comment.new
    @latest_comments = @project.latest_comments(5)
    @latest_updates = @project.latest_updates(5)
  end

  def new
    @project = Project.new
    @project.rewards.build
  end

  def create
    @project = Project.new
    @project.title = params[:project][:title]
    @project.description = params[:project][:description]
    @project.goal = params[:project][:goal]
    @project.start_date = params[:project][:start_date]
    @project.end_date = params[:project][:end_date]
    @project.image = params[:project][:image]
    @project.user_id = current_user.id
    @project.category_id = params[:category_id]

    if @project.save
      redirect_to projects_url
    else
      render :new
    end
   end

end
