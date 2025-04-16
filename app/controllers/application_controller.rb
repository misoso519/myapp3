class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :load_best_answer_rankinng
  protect_from_forgery with: :null_session, if: -> { request.format.json? }

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :bio, :profile_image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :bio, :profile_image])
  end

  private

  def load_best_answer_rankinng
    @sidebar_ranking_users = User
      .joins(answers: :likes)
      .group("users.id")
      .select("users.*, COUNT(likes.id) AS likes_count")
      .order("likes_count DESC")
      .limit(5)
  end
end
