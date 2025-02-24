class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question
  before_action :set_answer, only: [:update, :destroy]
  before_action :authorize_user!, only: [:update, :destroy]

  def create
    @answer = @question.answers.build(answer_params)
    @answer.user = current_user

    if @answer.save
      redirect_to @question, notice: "回答が投稿されました。"
    else
      render "questions/show"
    end
  end

  def edit
    @question = Question.find_by(id: params[:question_id])
    @answer = Answer.find_by(id: params[:id])
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

  def show
      @question = Question.find(params[:question_id])
      @answer = @question.answers.find(params[:id])
  end

  private

  def set_question
    @question = Question.find_by(id: params[:question_id])
    unless @question
      redirect_to questions_path, alert: "質問が見つかりません。"
    end
  end

  def set_answer
    @answer = @question.answers.find_by(id: params[:id])
    unless @answer
      redirect_to @question, alert: "回答が見つかりません。"
    end
  end

  def answer_params
    params.require(:answer).permit(:body, :image, :video)
  end

  def authorize_user!
    unless @answer&.user == current_user
      redirect_to @question, alert: "権限がありません。"
    end
  end
end
