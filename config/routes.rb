Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#hello'
  get '/orders', to: 'orders#index'
  get '/ratings', to: 'ratings#new'
  post '/ratings', to: 'ratings#create'
end
