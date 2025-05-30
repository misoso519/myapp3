Rails.application.routes.draw do
  get "notifications/index"
  get "users/show"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'devise/sessions',
    password: 'devise/passwords',
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :users, only: [:show]
  resources :notifications, only: [:index]

  # PWA 関連
  get "service-worker", to: "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest", to: "rails/pwa#manifest", as: :pwa_manifest

  # 検索
  get "search", to: "questions#search", as: :search
  get 'rankings/answer_likes', to: 'rankings#answer_likes', as: :answer_likes_ranking

  # 質問・回答
  resources :categories, only: [:index, :show]
  resources :questions do
    resources :answers, only: [:edit, :create, :destroy, :update, :show]
    resources :likes, only: [:create, :destroy], defaults: { likeable: 'question'}
  end
  resources :answers do
    resources :likes, only: [:create, :destroy], defaults: { likeable: 'answer' }
  end

  # ヘルスチェック
  get "up", to: "rails/health#show", as: :rails_health_check

  get 'contact', to: 'pages#contact'
  get 'terms', to: 'pages#terms'
  get 'privacy', to: 'pages#privacy'
  resources :contacts, only: [:create]
  get 'how_to_use', to: 'pages#how_to_use'

  # ルートページ
  root "questions#index"
end
