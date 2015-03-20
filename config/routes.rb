Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/superadmin', as: 'rails_admin'
  root 'static#private'
  get '/error' => 'static#private'

  devise_for :admins, path: 'export/admin'

  get '/export' => 'export#home'
  get '/export/responses' => 'export#response_index', as: 'responses'

  namespace :api, defaults: { format: 'json' } do
    resources :nodes, only: [:index, :show]
    resources :response, only: [:create]
    get '/respondents/get_or_create/' => 'respondents#get_or_create'
    post '/respondents/update' => 'respondents#update'
    get '/respondents/restart' => 'respondents#restart'
  end

end
