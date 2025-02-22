class Users::RegistrationsController < Devise::RegistrationsController
  protected

  # `current_password` なしで更新を許可
  def update_resource(resource, params)
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
      params.delete(:current_password)
      resource.update(params)
    else
      super
    end
  end
end
