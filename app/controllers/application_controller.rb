class ApplicationController < ActionController::API
  include Pundit
  before_action :update_allowed_parameters, if: :devise_controller?

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
end
