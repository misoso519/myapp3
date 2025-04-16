class RankingsController < ApplicationController
  def answer_likes
    @users = User
    .joins(answers: :likes)
    .group("users.id")
    .select("users.*, COUNT(likes.id) AS likes_count")
    .order("likes_count DESC")
  end
end
