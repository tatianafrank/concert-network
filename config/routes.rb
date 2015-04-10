Rails.application.routes.draw do
  root 'concerts#home'
  resources :concerts , :only =>[:new, :create, :index, :show] do
    resources :comments, :only =>[:new, :create]
  end
  # get '/concerts/new' => 'concerts#new'
  # post '/concerts' => 'concerts#create'
  # get '/concerts' => 'concerts#index', as: :concerts_index
  # get '/concerts/:id' => 'concerts#show', as: :concert

end

