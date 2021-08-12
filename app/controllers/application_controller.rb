class ApplicationController < ActionController::API
  include Pundit
  before_action :update_allowed_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_founded

  def route_not_founded
    render json: { error: 'This route not exist.' }, status: :not_found
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit :sign_in,
                                      keys: %i[email username]
    devise_parameter_sanitizer.permit :sign_up,
                                      keys: %i[email username password first_name last_name area_id
                                               career_id]
    devise_parameter_sanitizer.permit :account_update,
                                      keys: %i[username]
  end

  def user_not_authorized(exception)
    render json: { error: exception.message }, status: :forbidden
  end

  def record_not_founded(exception)
    render json: { error: exception.message }, status: :not_found
  end
end
