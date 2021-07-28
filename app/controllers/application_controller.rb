class ApplicationController < ActionController::API
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit :sign_up,
                                      keys: %i[email username password first_name last_name area_id
                                               career_id]
  end
end
