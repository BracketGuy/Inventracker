Rails.application.routes.draw do
  #Computer
  get '/computers',            to: 'computers#index'
  get '/computers/new',        to: 'computers#new'
  get '/computers/create',     to: 'computers#create'
  get '/computers/destroy',    to: 'computers#destroy'
  get '/computers/:id',        to: 'computers#show'
  get '/computers/:id/edit',   to: 'computers#edit'
  get '/computers/:id/update', to: 'computers#update'
  #User
  get '/users',                to: 'users#index'
  get '/users/new',            to: 'users#new'
  get '/users/create',         to: 'users#create'
  get '/users/destroy',        to: 'users#destroy'
  get '/users/:id',            to: 'users#show'
  get '/users/:id/edit',       to: 'users#edit'
  get '/users/:id/update',     to: 'users#update'
  #Root
  #root                         to: 'computers#index'
  root                         to: 'dashboard#index'
end
