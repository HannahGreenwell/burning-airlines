Rails.application.routes.draw do

  resources :airplanes

  get '/flights' => 'flights#new'
  post '/flights' => 'flights#create'
  get '/flight/:id' => 'flight#show'

  get '/search' => 'flights#search'

  get '/reservations' => 'reservations#new'
  get '/reservations' => 'reservations#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
