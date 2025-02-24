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
    Rails.logger.info("Attempting to delete answer #{@answer.id} by user #{current_user.id}")
    if @answer.destroy
      Rails.logger.info("Answer #{@answer.id} successfully deleted")
      redirect_to question_path(@question), notice: '回答を削除しました。'
    else
      Rails.logger.error("Failed to delete answer #{@answer.id}")
      redirect_to question_path(@question), alert: '削除に失敗しました。'
    end
  end
  
  def show
    @answer = Answer.find(params[:id])
  
    respond_to do |format|
      format.html # show.html.erb があるか確認
      format.json { render json: @answer }
    end
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
      Rails.logger.info("Unauthorized user: #{current_user&.id} tried to delete answer #{@answer&.id}")
      redirect_to @question, alert: "権限がありません。"
    end
  end
end
