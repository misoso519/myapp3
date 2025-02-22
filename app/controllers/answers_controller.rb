class AnswersController < ApplicationController
  before_action :authenticate_user!

  def create
    @answer = @question.answers.build(answer_params)
    @answer.user = current_user

    if @answer.save
      redirect_to @question, notice: "回答が投稿されました。"
    else
      render "questions/show"
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to @question, notice: '回答を更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to @question, notice: '回答を削除しました。'
  end

  private

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_answer
    @answer = @question.answers.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:body, :image, :video)
  end

  def authorize_user!
    redirect_to @question, alert: '権限がありません。' unless @answer.user == current_user
  end
end