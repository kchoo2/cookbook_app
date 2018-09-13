Rails.application.routes.draw do
  namespace :api do
    post "/users" => 'users#create'

    post '/sessions' => 'sessions#create'

    get "/recipes" => 'recipes#index'
    get "/recipes/:id" => 'recipes#show'
    post "/recipes" => 'recipes#create'
    patch "/recipes/:id" => 'recipes#update'
    delete "/recipes/:id" => 'recipes#destroy'
  end
end

