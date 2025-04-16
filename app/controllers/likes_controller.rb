class LikesController < ApplicationController
  before_action :set_likeable

  def create
    @like = @likeable.likes.create(user: current_user)
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_back fallback_location: root_path }
    end
  end

  def destroy
    @like = @likeable.likes.find_by(user: current_user)
    @like.destroy if @like
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_back fallback_location: root_path }
    end
  end

  private

  def set_likeable
    klass = params[:likeable].classify.constantize
    @likeable = klass.find(params["#{params[:likeable]}_id"])
  end
end
