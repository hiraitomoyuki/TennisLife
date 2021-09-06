class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:top]
  
  protected
  
  def after_sign_in_path_for(resource)
    user_path(resource)
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :nickname,
      :gender,
      :age,
      :email,
      :image,
      :postal_code,
      :prefecture_code,
      :address,
      :racket,
      :good_shot,
      ])
  end
end
