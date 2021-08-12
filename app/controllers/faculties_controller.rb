class FacultiesController < ApplicationController
  before_action :set_faculty, only: %i[show update destroy]

  # GET /faculties
  def index
    @faculties = Faculty.all

    render json: @faculties, only: %i[id name], include: {
      careers: { only: %i[id name] }
    }
  end

  # GET /faculties/1
  def show
    render json: @faculty, include: {
      careers: { only: %i[id name] }
    }
  end

  # POST /faculties
  def create
    @faculty = Faculty.new(faculty_params)
    authorize @faculty

    if @faculty.save
      render json: @faculty, status: :created, location: @faculty
    else
      render json: @faculty.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /faculties/1
  def update
    authorize @faculty
    if @faculty.update(faculty_params)
      render json: @faculty
    else
      render json: @faculty.errors, status: :unprocessable_entity
    end
  end

  # DELETE /faculties/1
  def destroy
    authorize @faculty
    @faculty.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_faculty
    @faculty = Faculty.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def faculty_params
    params.require(:faculty).permit(:name)
  end
end
