class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    if params[:q].present?
      @questions = Question.search(params[:q]).order(created_at: :desc)
    else
      @questions = Question.all.order(created_at: :desc)
    end
  end
  

  def show
    @answer = Answer.new
  end

  def new
    @question = Question.new
    @categories = Category.all.order(:name)
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      redirect_to @question, notice: "質問が投稿されました。"
    else
      @categories = Category.all.order(:name)
      render :new
    end
  end

  def edit
    authorize_user!
  end

  def update
    if @question.update(question_params)
      redirect_to @question, notice: "質問が更新されました。"
    else
      render :edit
    end
  end

  def destroy
    authorize_user!
    @question.destroy
    redirect_to questions_path, notice: "質問が削除されました。"
  end  

  def search
    @questions = Question.search(params[:query])
    render :index
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :body, :category_id, :image, :video)
  end

  def authorize_user!
    # 投稿者のみが編集・削除できるようにする
    redirect_to @question, alert: '権限がありません。' unless @question.user == current_user
  end
end
