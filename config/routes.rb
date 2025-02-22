Rails.application.routes.draw do
  devise_for :users, controllers: {
  registrations: 'users/registrations'
}
  get "answers/create"
  get "answers/destroy"
  get "questions/index"
  get "questions/show"
  get "questions/new"
  get "questions/create"
  get "questions/edit"
  get "questions/update"
  get "questions/destroy"
  get "categories/index"
  get "categories/show"
  get "up" => "rails/health#show", as: :rails_health_check
  get "search", to: "questions#search", as: :search


  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  resources :categories, only: [:index, :show]
  resources :questions do
    resources :answers, only: [:create, :destroy]
  end
  resources :questions do
    resources :answers, only: [:create, :destroy]
  end  

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root "questions#index"
end
