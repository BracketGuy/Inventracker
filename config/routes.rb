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
  #Site
  get '/sites',                to: 'sites#index'
  get '/sites/new',            to: 'sites#new'
  get '/sites/create',         to: 'sites#create'
  get '/sites/destroy',        to: 'sites#destroy'
  get '/sites/:id',            to: 'sites#show'
  get '/sites/:id/edit',       to: 'sites#edit'
  get '/sites/:id/update',     to: 'sites#update'
  #Root
  root                         to: 'dashboard#index'
end
