Rails.application.routes.draw do

  devise_for :sellers
  devise_for :buyers

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  get '/orders', to: 'orders#index'

  # Ratinds controller
  get '/ratings/:order_id', to: 'ratings#new', as: 'new_rating'
  post '/ratings/:order_id', to: 'ratings#create'
  
  # Cart controller
  get '/showcart', to: 'cart#showcart'
  post '/cart/:id', to: 'cart#additem'
  delete '/cart/:id', to: 'cart#deleteitem'
  post '/orderplaced', to: 'cart#placeorder'
  
  # Items controller
  get '/items/:id', to: 'items#show'
  get '/items/new', to: 'items#new'
  post '/items', to: 'items#create'
  
  # Profile controller
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
