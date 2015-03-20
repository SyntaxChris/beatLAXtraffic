Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/superadmin', as: 'rails_admin'
  root 'static#private'
  get '/error' => 'static#private'

  devise_for :admins, path: 'export/admin'

  get '/export/home' => 'export#home', as: 'export_home'
  get '/export' => 'export#login'
  get '/export/responses' => 'export#response_index', as: 'responses'
  get '/export/codified_responses' => 'export#codified_response_index', as: 'codified_responses'
  get '/export/codebook_reference' => 'export#codebook_reference', as: 'codebook_reference'

  namespace :api, defaults: { format: 'json' } do
    resources :nodes, only: [:index, :show]
    resources :response, only: [:create]
    get '/respondents/get_or_create/' => 'respondents#get_or_create'
    post '/respondents/update' => 'respondents#update'
    get '/respondents/restart' => 'respondents#restart'
  end

end
