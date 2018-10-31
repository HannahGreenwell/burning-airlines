Rails.application.routes.draw do

  get 'airplanes/new'
  get 'airplanes/create'
  get 'airplanes/show'
  get 'airplanes/index'
  resources :airplanes
  

  get '/flights/new' => 'flights#new'
  post '/flights' => 'flights#create'
  get '/flight/:id' => 'flights#show'

  post '/search/find' => 'flights#search', as: 'search_find'
  get '/search' => 'flights#find_page'

  get '/reservations/new' => 'reservations#new'
  get '/reservation/:id' => 'reservations#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
