class PartsController < ApplicationController
  before_action :set_part, only: [:show, :edit, :update, :destroy]

  # GET /parts
  # GET /parts.json
  def index
    @parts = Part.all
  end

  # GET /parts/1
  # GET /parts/1.json
  def show
  end

  # GET /parts/new
  def new
    @user = current_user
    @project = @user.projects.find(params[:user_id])
    @part = @project.parts.new
  end

  # GET /parts/1/edit
  def edit
    @user = current_user
    @project = @user.projects.find(params[:user_id])
    @part = @project.parts.find(params[:id])
  end

  # POST /parts
  # POST /parts.json
  def create
    @user = current_user
    @project = @user.projects.find(params[:user_id])
    @part = @project.parts.new(part_params)
    # binding.pry
    respond_to do |format|
      if @part.save
        format.html { redirect_to user_project_path(current_user, params[:user_id]), notice: 'Part was successfully created.' }
        format.json { render :show, status: :created, location: @part }
      else
        format.html { render partial: 'new' }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parts/1
  # PATCH/PUT /parts/1.json
  def update
    respond_to do |format|
      if @part.update(part_params)
        format.html { redirect_to user_project_path(current_user, params[:user_id]), notice: 'Part was successfully updated.' }
        format.json { render :show, status: :ok, location: @part }
      else
        format.html { render :edit }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parts/1
  # DELETE /parts/1.json
  def destroy
    @part.destroy
    respond_to do |format|
      format.html { redirect_to user_project_path(current_user, params[:user_id]), notice: 'Part was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_part
      @part = Part.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def part_params
      params.require(:part).permit(:name, :description).merge(user_id: params[:user_id], project_id: params[:project_id])
    end
end
