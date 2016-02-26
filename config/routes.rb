Rails.application.routes.draw do
  root 'sessions#new'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/buy' => 'sessions#buy'
  get '/reset_password' => 'sessions#reset_password'
  post '/send_password' => 'sessions#send_password', as: :send_password

  get '/admin' => 'admin#index'

  get '/admin_users' => 'admin#admin_users'
  post '/create_user' => 'admin#create_user'
  delete '/delete_user/:id' => 'admin#delete_user', as: :delete_user
  get '/edit_user/:id' => 'admin#edit_user', as: :edit_user
  patch '/update_user/:id' => 'admin#update_user', as: :update_user

  get '/admin_exams' => 'admin#admin_exams'
  post '/create_exam' => 'admin#create_exam'
  get '/edit_exam/:id' => 'admin#edit_exam', as: :edit_exam
  patch '/update_exam/:id' => 'admin#update_exam', as: :update_exam
  delete '/delete_exam/:id' => 'admin#delete_exam', as: :delete_exam

  get '/new_question/:id' => 'admin#new_question', as: :new_question
  post '/create_question/:id' => 'admin#create_question', as: :create_question
  get '/exam_questions/:id' => 'admin#exam_questions', as: :exam_questions
  get '/edit_question/:id' => 'admin#edit_question', as: :edit_question
  patch '/update_question/:id' => 'admin#update_question', as: :update_question
  delete '/delete_question/:id' => 'admin#delete_question', as: :delete_question
  get '/preview_exam/:id' => 'admin#preview_exam', as: :preview_exam

  get '/user' => 'user#index'
  get '/user_exam/:id' => 'user#user_exam', as: :user_exam
  post '/user_exam_save/:id' => 'user#user_exam_save', as: :user_exam_save
  get '/change_password' => 'user#change_password', as: :change_password
  post '/update_password' => 'user#update_password', as: :update_password
  get '/user_edit_info' => 'user#user_edit_info', as: :user_edit_info
  patch '/user_update_info/:id' => 'user#user_update_info', as: :user_update_info

  match 'payed', to: 'payment#payed', via: [:get, :post], as: :payed
  get '/thanks' => 'payment#thanks', as: :thanks
end
