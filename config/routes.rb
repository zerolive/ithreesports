Rails.application.routes.draw do
  root 'sessions#new'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

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
end
