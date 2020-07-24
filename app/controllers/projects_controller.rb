class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :show, :destroy]

  def ind
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(name: params[:project]["name"], user_id: current_user.id)
    if @project.save
      flash[:success] = "Project was created successfully!"
      redirect_to project_path(@project)
    else
      flash.now[:danger] = "Somthing went wrong!"
      render 'new'
    end
  end

  def show

  end

  def edit

  end

  def update
    if @project.update(project_params)
      flash[:success] = "Project was updated successfully!"
      redirect_to @project
    else
      render "edit"
    end
  end

  def destroy
    @project.destroy
    flash[:success] = "Project and all associated associated task have been deleted!"
    redirect_to projects_path
  end
  
  private
    def set_project
      @project = Project.find([:id])
    end

    def project_params
      params.require(:project).permit(:name)
    end

end
