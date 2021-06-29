Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'submissions#new'
  get '/*path', to: 'submissions#show'
  resources :submissions, only: [:create]
  post 'submission/reset_session' => 'submissions#reset_session'
end
