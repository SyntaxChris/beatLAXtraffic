Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/superadmin', as: 'rails_admin'
  root 'static#private'
  get '/error' => 'static#private'

  devise_for :admins, path: 'export/admin'

  get '/export/home' => 'export#home', as: 'export_home'
  get '/export' => 'export#login'
  get '/export/responses' => 'export#response_index', as: 'responses'
  get '/export/respondents' => 'export#respondents_index', as: 'respondents'
  get '/export/responses_with_variables' => 'export#responses_with_variables', as: 'responses_with_variables'
  get '/export/codified_responses' => 'export#codified_response_index', as: 'codified_responses'
  get '/export/codebook_reference' => 'export#codebook_reference', as: 'codebook_reference'

  namespace :api, defaults: { format: 'json' } do
    resources :nodes, only: [:index, :show]
    resources :response, only: [:create]
    post '/response/story' => 'response#story_share'
    get '/respondents/get_or_create/' => 'respondents#get_or_create'
    post '/respondents/update' => 'respondents#update'
    get '/respondents/restart' => 'respondents#restart'
  end

end
