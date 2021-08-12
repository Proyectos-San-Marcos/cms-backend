class CareersController < ApplicationController
  before_action :set_career, only: %i[show update destroy]

  # GET /careers
  def index
    @careers = Career.all

    render json: @careers, only: %i[id name faculty_id]
  end

  # GET /careers/1
  def show
    render json: @career
  end

  # POST /careers
  def create
    @career = Career.new(career_params)
    authorize @career

    if @career.save
      render json: @career, status: :created, location: @career
    else
      render json: @career.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /careers/1
  def update
    authorize @career
    if @career.update(career_params)
      render json: @career
    else
      render json: @career.errors, status: :unprocessable_entity
    end
  end

  # DELETE /careers/1
  def destroy
    authorize @career
    @career.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_career
    @career = Career.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def career_params
    params.require(:career).permit(:name, :faculty_id)
  end
end
