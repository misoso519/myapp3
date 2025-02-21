class AnswersController < ApplicationController
  before_action :authenticate_user!

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    @answer.user = current_user

    if @answer.save
      redirect_to @question, notice: "回答が投稿されました。"
    else
      render "questions/show"
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body, :image, :video)
  end
end
