Rails.application.routes.draw do
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#hello'
  get '/orders', to: 'orders#index'
  get '/ratings/:order_id', to: 'ratings#new', as: 'new_rating'
  post '/ratings/:order_id', to: 'ratings#create'
end
