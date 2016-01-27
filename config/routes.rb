Rails.application.routes.draw do
  root 'sessions#new'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/admin' => 'admin#index'
  get '/admin_users' => 'admin#users_index'
  get '/admin_courses' => 'admin#courses_index'
  post '/create_user' => 'admin#create_user'
  delete '/delete_user/:id' => 'admin#delete_user', as: :delete_user
  get '/edit_user/:id' => 'admin#edit_user', as: :edit_user
end
