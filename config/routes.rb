Rails.application.routes.draw do
  namespace :api do

    post "/users" => "users#create"
    get "/users" => "users#index"
    get "/users/:id" => "users#show"

    post "/sessions" => "sessions#create"

  end
end
