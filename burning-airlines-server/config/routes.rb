Rails.application.routes.draw do

  resources :airplanes

  get '/flights' => 'flights#index'
  get '/flights/new' => 'flights#new'
  post '/flights' => 'flights#create'
  get '/flight/:id' => 'flights#show', as: 'flight_show'

  post '/search/find' => 'flights#search', as: 'search_find'
  get '/search' => 'flights#find_page'

  get '/reservations/new' => 'reservations#new'
  get '/reservation/:id' => 'reservations#show', as: 'reservation_booked'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
