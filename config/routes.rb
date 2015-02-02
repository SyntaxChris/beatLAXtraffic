Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/superadmin', as: 'rails_admin'
  root 'example#index'

  # short-circuit rails routes and hand control off to angular:
  get 'example' => 'example#index'
  get 'test' => 'static#private'

  namespace :api, defaults: { format: 'json' } do
    resources :nodes, only: [:index, :show]
    resources :response, only: [:create]
    get '/respondents/get_or_create/' => 'respondents#get_or_create'
    post '/respondents/update' => 'respondents#update'
  end
end
