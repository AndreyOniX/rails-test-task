Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      # HACK - bad practice
      post '/tt/0413' => 'tt0413s#create'
    end
  end

end
