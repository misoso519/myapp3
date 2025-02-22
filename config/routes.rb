Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  # PWA 関連
  get "service-worker", to: "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest", to: "rails/pwa#manifest", as: :pwa_manifest

  # 検索
  get "search", to: "questions#search", as: :search

  # 質問・回答
  resources :categories, only: [:index, :show]
  resources :questions do
    resources :answers, only: [:edit, :create, :destroy]
  end

  # Devise のログアウトは DELETE メソッドを使用
  devise_scope :user do
    delete '/users/sign_out', to: 'devise/sessions#destroy'
  end

  # ヘルスチェック
  get "up", to: "rails/health#show", as: :rails_health_check

  # ルートページ
  root "questions#index"
end
