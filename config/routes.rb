Rails.application.routes.draw do
  get '/competitions', to: 'competitions#index'
  get '/competitions/:id', to: 'competitions#show'

  get '/competitions/:id/teams/new', to: 'competitions#new'
  post '/competitions/:id/teams', to: 'competition_teams#create'

  get '/teams', to: 'teams#index'
end
