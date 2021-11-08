Rails.application.routes.draw do

  devise_for :buyers
  get 'home/index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  get '/orders', to: 'orders#index'
  get '/ratings/:order_id', to: 'ratings#new', as: 'new_rating'
  get '/items/new', to: 'items#new'
  post '/items', to: 'items#create'
  post '/ratings/:order_id', to: 'ratings#create'
  get '/showcart', to: 'cart#showcart'
  post '/orderplaced', to: 'cart#placeorder'
  # route to get item id info
  get '/items/:id', to: 'items#show'
  post '/cart/:id', to: 'cart#additem'
end
