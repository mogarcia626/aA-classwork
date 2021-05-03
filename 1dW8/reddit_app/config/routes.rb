Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'users/new'
  get 'users/create'
  get 'users/edit'
  get 'users/index'
  get 'users/show'
  get 'users/destroy'
  get 'users/update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
