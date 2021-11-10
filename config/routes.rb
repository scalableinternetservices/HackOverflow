Rails.application.routes.draw do

  devise_for :sellers
  devise_for :buyers

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  get '/orders', to: 'orders#index'
  get '/ratings/:order_id', to: 'ratings#new', as: 'new_rating'
  get '/items/new', to: 'items#new'
  post '/items', to: 'items#create'
  post '/ratings/:order_id', to: 'ratings#create'
  
  #Cart controller
  get '/showcart', to: 'cart#showcart'
  get '/showcart/:id', to: 'cart#showcart'
  post '/orderplaced', to: 'cart#placeorder'
  
  # route to get item id info
  get '/items/:id', to: 'items#show'
  post '/cart/:id', to: 'cart#additem'
  delete '/cart/:id', to: 'cart#deleteitem'
  get '/profile/buyer', to: 'profiles#buyer'
  get '/profile/seller', to: 'profiles#seller'  

end

=begin

This is what I have seen after running 'rails g devise:controllers buyers' and sellers too. Might be useful

Some setup you must do manually if you haven't yet:

  Ensure you have overridden routes for generated controllers in your routes.rb.
  For example:

    Rails.application.routes.draw do
      devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
    end
=end
