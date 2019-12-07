Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :users
  end

  root to: 'tasks#index' # ルートディレクトリ
  resources :tasks do
    # 確認画面はCRUDアクションと見做されていないため、resourcesとは別に定義する
    # tasks/new/confirm
    post :confirm, action: :confirm_new, on: :new
  end
end
