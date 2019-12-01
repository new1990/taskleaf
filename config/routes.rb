Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end

  root to: 'tasks#index' # ルートディレクトリ
  resources :tasks
end
