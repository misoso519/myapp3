# トップページ
crumb :root do
  link "TOP", root_path
end

# 質問一覧
crumb :questions do
  link "質問一覧", questions_path
  parent :root
end

# 質問詳細
crumb :question do |question|
  link question.title, question_path(question)
  parent :root
end

# カテゴリ
crumb :category do |category|
  link category.name, category_path(category)
  parent :root
end

# ユーザーページ
crumb :user do |user|
  link user.name, user_path(user)
  parent :root
end

# 回答編集ページ
crumb :edit_answer do |question, answer|
  link "回答を編集", edit_question_answer_path(question, answer)
  parent :question, question
end

crumb :new_question do
  link "質問を投稿", new_question_path
  parent :root
end

crumb :edit_question do |question|
  link "質問を編集", edit_question_path(question)
  parent :question, question
end

crumb :notifications do
  link "通知一覧", notifications_path
  parent :root
end

crumb :answer_likes_ranking do
  link "いいねランキング", answer_likes_ranking_path
  parent :root
end
