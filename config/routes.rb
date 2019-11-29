Rails.application.routes.draw do
  root to: 'tasks#index' # ルートディレクトリ
  resources :tasks
end
