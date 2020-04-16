Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'submissions', to: 'tt0413s#index', as: 'dashboard'

  namespace :api do
    namespace :v1 do
      # HACK - bad practice
      post '/tt/0413' => 'tt0413s#create'
    end
  end

end
