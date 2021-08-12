class ManagementsController < ApplicationController
  before_action :set_management, only: %i[show update destroy]

  # GET /managements
  def index
    @managements = Management.all

    render json: @managements, only: %i[id name], include: {
      areas: { only: %i[id name] }
    }
  end

  # GET /managements/1
  def show
    render json: @management
  end

  # POST /managements
  def create
    @management = Management.new(management_params)
    authorize @management

    if @management.save
      render json: @management, status: :created, location: @management
    else
      render json: @management.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /managements/1
  def update
    authorize @management
    if @management.update(management_params)
      render json: @management
    else
      render json: @management.errors, status: :unprocessable_entity
    end
  end

  # DELETE /managements/1
  def destroy
    authorize @management
    @management.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_management
    @management = Management.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def management_params
    params.require(:management).permit(:name)
  end
end
