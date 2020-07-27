class BugsController < ApplicationController
  before_action :get_project
  before_action :set_bug, only: [:show, :edit, :update]
  before_action :bug_params, only: [:create]

  def index
    @bugs = @project.bugs
  end

  def new
    @bug = @project.bugs.build
  end

  def create
    @bug = @project.bugs.build(bug_params)
    if @bug.save
      flash[:success] = "Bug was created successfully"
      redirect_to project_bugs_path(@project)
    else
      flash.now[:notice] = "Something went wrong"
      render 'new'
    end
  end

  def show

  end

  def edit

  end

  def update
    if @bug.update(bug_params)
      flash[:success] = "Bug was updated successfully"
      redirect_to project_bugs_path(@project)
    else
      flash[:notice] = "Something went wrong!"
      render 'edit'
    end
  end


  private

    def get_project
      @project = Project.find(params[:project_id])
    end

    def set_bug
      # debugger
      @bug = @project.bugs.find(params[:id])
    end

    def bug_params
      params.require(:bug).permit(:title, :description, :deadline, :sc, :task_type, :status)
    end

end
