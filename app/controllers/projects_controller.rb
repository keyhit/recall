class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    # @user = User.find(params[:user_id]) 
    @projects = current_user.projects
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project_users = @project.users
  end

  # GET /projects/new
  def new
    # binding.pry

    @project = current_user.projects.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @projects = current_user.projects
    @project = current_user.projects.new(project_params)

    respond_to do |format|
      if @projects << @project
        format.html { redirect_to user_projects_path(current_user), notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to user_projects_path(current_user), notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to user_projects_path(current_user), notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_collaborator
    @project = Project.find(params[:project_id])
    @user = User.find_by(email: params[:email])

    respond_to do |format|
      # binding.pry
      if @project.admin_id != current_user.id
      format.html { redirect_to user_project_path(current_user, params[:project_id]),
          notice: 'You not this project`s admin!' }
      elsif @project.users.where(id: @user.id).present?
          format.html { redirect_to user_project_path(current_user, @project),
            notice: 'You can not add same user twice to this project!' }
      elsif @project.users << @user
        format.html { redirect_to user_project_path(current_user, @project), notice: 'Collaborant has been added!' }
      else
        format.html { redirect_to user_project_path(current_user, @project), notice: 'Error adding a collaborant!' }
      end
    end
  end

  def drop_collaborator
    @project = Project.find(params[:project_id])
    @user = User.find(params[:user_id])

      respond_to do |format|
      if @project.admin_id  != current_user.id
        format.html { redirect_to user_project_path(current_user, params[:project_id]),
          notice: 'This collaborant can`t be dropped!' }
      elsif @project.users.delete(params[:user_id])
        format.html { redirect_to user_project_path(current_user, params[:project_id]),
          notice: 'Collaborant has been dropped!' }
      else
        format.html { redirect_to user_project_path(current_user, params[:project_id]), notice: 'Error drooping a collaborant!' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :description, :email).merge(admin_id: current_user.id)
    end
end
