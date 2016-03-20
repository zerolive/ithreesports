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

  get '/admin_courses' => 'admin#admin_courses'
  post '/create_course' => 'admin#create_course'
  get '/edit_course/:id' => 'admin#edit_course', as: :edit_course
  patch '/update_course/:id' => 'admin#update_course', as: :update_course
  delete '/delete_course/:id' => 'admin#delete_course', as: :delete_course
  get '/preview_course/:id' => 'admin#preview_course', as: :preview_course

  get '/new_media_file/:id' => 'admin#new_media_file', as: :new_media_file
  post '/create_media_file/:id' => 'admin#create_media_file', as: :create_media_file
  get '/show_media_files/:id' => 'admin#show_media_files', as: :show_media_files
  get '/edit_media_file/:id' => 'admin#edit_media_file', as: :edit_media_file
  patch '/update_media_file/:id' => 'admin#update_media_file', as: :update_media_file
  delete '/delete_media_file/:id' => 'admin#delete_media_file', as: :delete_media_file

  get '/new_exam/:id' => 'admin#new_exam', as: :new_exam
  post '/create_exam/:id' => 'admin#create_exam', as: :create_exam
  get '/show_exams/:id' => 'admin#show_exams', as: :show_exams
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
  get '/new_answer/:id' => 'admin#new_answer', as: :new_answer
  post '/create_answer/:id' => 'admin#create_answer', as: :create_answer
  get '/edit_answer/:id' => 'admin#edit_answer', as: :edit_answer
  patch '/update_answer/:id' => 'admin#update_answer', as: :update_answer
  delete '/delete_answer/:id' => 'admin#delete_answer', as: :delete_answer

  get '/new_purchased/:id' => 'admin#new_purchased', as: :new_purchased
  post '/create_purchased/:id' => 'admin#create_purchased', as: :create_purchased
  delete '/delete_purchased/:id/:course_id' => 'admin#delete_purchased', as: :delete_purchased

  get '/user' => 'user#index'
  get '/user_exam/:id' => 'user#user_exam', as: :user_exam
  post '/user_exam_save/:id' => 'user#user_exam_save', as: :user_exam_save
  get '/change_password' => 'user#change_password', as: :change_password
  post '/update_password' => 'user#update_password', as: :update_password
  get '/user_edit_info' => 'user#user_edit_info', as: :user_edit_info
  patch '/user_update_info/:id' => 'user#user_update_info', as: :user_update_info

  match 'payed', to: 'payment#payed', via: [:get, :post], as: :payed
  get '/thanks' => 'payment#thanks', as: :thanks

  get '*path' => redirect('/')
end
