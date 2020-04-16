Rails.application.routes.draw do

  root to: 'home#welcome'

  resources :sessions, only: [:new, :create, :destroy]

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'submissions', to: 'tt0413s#index'

  namespace :api do
    namespace :v1 do
      # HACK - bad practice
      post '/tt/0413' => 'tt0413s#create'
    end
  end

end
