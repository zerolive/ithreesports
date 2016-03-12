require 'rails_helper'

RSpec.describe AdminController, type: :controller do

	context 'If admin is not logged' do

		before do
			session[:user_id] = nil
		end

		describe 'get#index' do
			it 'redirects to signin path' do
				get :index

				expect(response.status).to eq(302)
				expect(response).to redirect_to signin_path
			end
		end

		describe 'get#admin_users' do
			it 'redirects to signin path' do
				get :admin_users

				expect(response.status).to eq(302)
				expect(response).to redirect_to signin_path
			end
		end

		describe 'post#create_user' do
			let(:new_user){ build(:user) }
			it 'redirects to signin path' do
				post :create_user, user: {name: new_user.name, password_digest: new_user.password_digest, level: new_user.level}

				expect(response.status).to eq(302)
				expect(response).to redirect_to signin_path
			end
		end

		describe 'get#delete_user' do
			it 'redirects to signin path' do
				user_to_delete = create(:user)
				delete :delete_user, id: user_to_delete.id

				expect(response.status).to eq(302)
				expect(response).to redirect_to signin_path
			end
		end

		describe 'patch#update_user' do
			it 'redirects to signin path' do
				user_to_edit = create(:user, name: 'OldName')
				patch :update_user, id: user_to_edit.id, user: { name: 'NewName', password_digest: user_to_edit.password_digest, level: user_to_edit.level}

				expect(response.status).to eq(302)
				expect(response).to redirect_to signin_path
			end
		end

		describe 'get#admin_courses' do
			it 'redirects to signin path' do
				get :admin_courses
				
				expect(response.status).to eq(302)
				expect(response).to redirect_to signin_path
			end
		end

		describe 'post#create_course' do
			let(:new_course){ create(:course) }

			it 'redirects to signin path' do
				post :create_course, course: { name: new_course.name, imageurl: new_course.imageurl, price: new_course.price, description: new_course.description, videourl: new_course.videourl}

				expect(response.status).to eq(302)
				expect(response).to redirect_to signin_path
			end
		end

		describe 'get#edit_course' do
			let(:course){ create(:course) }

			it 'redirects to signin path' do
				get :edit_course, id: course.id
				
				expect(response.status).to eq(302)
				expect(response).to redirect_to signin_path
			end
		end

		describe 'patch#update_course' do
			let(:course){ create(:course) }

			it 'redirects to signin path' do
				patch :update_course, id: course.id, course: { name: course.name, price: course.price, imageurl: "", videourl: "", comment: "" }

				expect(response.status).to eq(302)
				expect(response).to redirect_to signin_path
			end
		end

		describe 'delete#delete_course' do
			let(:course){ create(:course) }

			it 'redirects to signin path' do
				delete :delete_course, id: course.id

				expect(response.status).to eq 302
				expect(response).to redirect_to signin_path
			end
		end

		describe 'get#preview_course' do
			let(:course){ create(:course) }

			it 'redirects to sign in path' do
				get :preview_course, id: course.id

				expect(response.status).to eq 302
				expect(response).to redirect_to signin_path
			end
		end

		describe 'get#new_media_file' do
			let(:course){ create(:course) }
			it 'redirects to sign in path' do
				get :new_media_file, id: course.id

				expect(response.status).to eq 302
				expect(response).to redirect_to signin_path
			end
		end

		describe 'post#create_media_file' do
			let(:course){ create(:course) }
			let(:media_file){ create(:media_file) }

			it 'redirects to sign in path' do
				post :create_media_file, id: course.id, media_file: { url: media_file.url, name: media_file.name }

				expect(response.status).to eq 302
				expect(response).to redirect_to signin_path
			end
		end

		describe 'get#show_media_files' do
			let(:course){ create(:course) }

			it 'redirects to sign in path' do
				get :show_media_files, id: course.id

				expect(response.status).to eq 302
				expect(response).to redirect_to signin_path
			end
		end

		describe 'get#edit_media_file' do
			let(:media_file){ create(:media_file) }

			it 'redirects to sign in path' do
				get :edit_media_file, id: media_file.id, media_file: { name: media_file.name, url: media_file.url }

				expect(response.status).to eq 302
				expect(response).to redirect_to signin_path
			end
		end

		describe 'patch#update_media_file' do
			let(:media_file){ create(:media_file) }

			it 'redirects to sign in path' do
				patch :update_media_file, id: media_file.id

				expect(response.status).to eq 302
				expect(response).to redirect_to signin_path
			end
		end

		describe 'delete_media_file' do
			let(:media_file){ create(:media_file) }

			it 'redirects to sign in path' do
				delete :delete_media_file, id: media_file.id

				expect(response.status).to eq 302
				expect(response).to redirect_to signin_path
			end
		end

		describe 'post#create_exam' do
			let(:course){ create(:course) }
			let(:new_exam){ build(:exam) }

			it 'redirects to signin path' do
				new_exam.course_id = course.id

				post :create_exam, id: new_exam.course_id, exam: {title: new_exam.title, video: new_exam.video, level: new_exam.level, comment: new_exam.comment }

				expect(response.status).to eq(302)
				expect(response).to redirect_to signin_path
			end
		end

		describe 'get#edit_exam' do
			let(:exam_to_edit){ create(:exam) }

			it 'redirects to signin path' do
				get :edit_exam, id: exam_to_edit.id

				expect(response.status).to eq(302)
				expect(response).to redirect_to signin_path
			end
		end

		describe 'get#show_exams' do
			let(:course){ create(:course) }

			it 'redirects to signin path' do
				get :show_exams, id: course.id

				expect(response.status).to eq(302)
				expect(response).to redirect_to signin_path
			end
		end

		describe 'patch#update_exam' do
			let(:exam_to_edit){ create(:exam) }

			it 'redirects to signin path' do
				patch :update_exam, id: exam_to_edit.id, exam: { title: 'NewTitle', video: exam_to_edit.video, level: exam_to_edit.level, comment: exam_to_edit.comment }

				expect(response.status).to eq(302)
				expect(response).to redirect_to signin_path
			end
		end

		describe 'delete#delete_exam' do
			let(:exam_to_delete){ create(:exam) }

			it 'redirects to signin path' do
				delete :delete_exam, id: exam_to_delete.id

				expect(response.status).to eq(302)
				expect(response).to redirect_to signin_path
			end
		end

		describe 'get#new_question' do
			let(:exam_to_add_question){ create(:exam) }
			it 'redirects to signin path' do
				get :new_question, id: exam_to_add_question.id

				expect(response.status).to eq(302)
				expect(response).to redirect_to signin_path
			end
		end

		describe 'post#create_question' do
			let(:exam){ create(:exam) }
			let(:new_question){ build(:question) }

			it 'redirects to signin path' do
				post :create_question, id: exam.id, question: {title: new_question.title, answer: new_question.answer}

				expect(response.status).to eq(302)
				expect(response).to redirect_to signin_path
			end
		end

		describe 'get#exam_questions' do
			let(:exam){create(:exam)}

			it 'redirects to signin path' do
				get :exam_questions, id: exam.id

				expect(response.status).to eq(302)
				expect(response).to redirect_to signin_path
			end
		end

		describe 'get#edit_question' do
			let(:question){create(:question)}

			it 'redirects to signin path' do
				get :edit_question, id: question

				expect(response.status).to eq(302)
				expect(response).to redirect_to signin_path
			end
		end

		describe 'patch#update_question' do
			let(:question){create(:question)}

			it 'redirects to signin path' do
				patch :update_question, id: question, question: { title: 'NewTitle', answer: true }

				expect(response.status).to eq(302)
				expect(response).to redirect_to signin_path
			end
		end

		describe 'delete#delete_question' do
			let(:exam_with_10_questions){create(:exam_with_questions)}

			it 'redirects to signin path' do
				delete :delete_question, id: exam_with_10_questions.questions.first

				expect(response.status).to eq(302)
				expect(response).to redirect_to signin_path
			end
		end

		describe 'get#preview_exam' do
			let(:exam){ create(:exam) }
			it 'redirects to signin path' do
				get :preview_exam, id: exam.id

				expect(response.status).to eq(302)
				expect(response).to redirect_to signin_path
			end
		end

		describe 'get#new_answer' do
			let(:question){ create(:question) }
			it 'redirects to signin path' do
				get :new_answer, id: question.id

				expect(response.status).to eq(302)
				expect(response).to redirect_to signin_path
			end
		end

		describe 'post#create_answer' do
			let(:question){ create(:question) }
			let(:answer){ build(:answer) }

			it 'redirects to signin path' do
				post :create_answer, id: question.id, answer: { title: answer.title , right: answer.right}

				expect(response.status).to eq(302)
				expect(response).to redirect_to signin_path
			end
		end

		describe 'get#edit_answer' do
			let(:question_with_answers){ create(:question_with_answers) }

			it 'redirects to signin path' do
				answer = question_with_answers.answer.first

				get :edit_answer, id: answer.id

				expect(response.status).to eq(302)
				expect(response).to redirect_to signin_path
			end
		end

		describe 'patch#update_answer' do
			let(:question_with_answers){ create(:question_with_answers) }

			it 'redirects to signin path' do
				answer = question_with_answers.answer.first

				patch :update_answer, id: answer.id, answer: { title: 'new title', right: answer.right }

				expect(response.status).to eq(302)
				expect(response).to redirect_to signin_path
			end
		end

		describe 'delete#delete_answer' do
			let(:question_with_answers){ create(:question_with_answers) }

			it 'redirects to signin path' do
				answer = question_with_answers.answer.first

				patch :delete_answer, id: answer.id

				expect(response.status).to eq(302)
				expect(response).to redirect_to signin_path
			end
		end
	end

	context 'If admin is logged' do
		let(:logged_admin){create(:admin)}

		before do
			session[:user_id] = logged_admin.id
		end

		describe 'get#index' do
			it 'response with status OK' do
				get :index

				expect(response.status).to eq(200)
			end
		end

		describe 'get#admin_users' do
			it 'response with status OK' do
				get :admin_users

				expect(response.status).to eq(200)
			end
		end

		describe 'post#create_user' do
			let(:new_user){ build(:user) }
			it 'can create a user and redirect to admin user index' do
				post :create_user, user: {email: new_user.email, name: new_user.name, password_digest: new_user.password_digest, level: new_user.level}

				expect(response.status).to eq 302
				expect(assigns(:user).errors.size).to eq 0
				expect(response).to redirect_to admin_users_path
			end

			it 'cannot create a user without level' do
				post :create_user, user: {email: new_user.email, name: new_user.name, password_digest: new_user.password_digest, level: nil}

				expect(response.status).to eq 302
				expect(response).to redirect_to admin_users_path
				expect(assigns(:user).errors.size).to_not eq 0
			end

			it 'cannot create a user without password_digest' do
				post :create_user, user: {email: new_user.email, name: new_user.name, password_digest: nil, level: new_user.level}

				expect(response.status).to eq 302
				expect(response).to redirect_to admin_users_path
				expect(assigns(:user).errors.size).to_not eq 0
			end

			it 'cannot create a user without name' do
				post :create_user, user: {email: new_user.email, name: nil, password_digest: new_user.password_digest, level: new_user.level}

				expect(response.status).to eq 302
				expect(response).to redirect_to admin_users_path
				expect(assigns(:user).errors.size).to_not eq 0
			end
		end

		describe 'get#delete_user' do
			it 'destroys a user and redirects to admin users index' do
				user_to_delete = create(:user)
				delete :delete_user, id: user_to_delete.id

				expect(response.status).to eq 302
				expect(response).to redirect_to admin_users_path
			end
		end

		describe 'patch#update_user' do
			it ' saves the changes and redirects to users index' do
				user_to_edit = create(:user, name: 'OldName')
				patch :update_user, id: user_to_edit.id, user: { name: 'NewName', password_digest: user_to_edit.password_digest, level: user_to_edit.level}

				expect(response.status).to eq 302
				expect(response).to redirect_to admin_users_path
				expect(assigns(:user).name).to eq 'NewName'
				expect(assigns(:user).errors.size).to eq 0
			end

			it ' cannot save a user without name and redirects to users index' do
				user_to_edit = create(:user)
				patch :update_user, id: user_to_edit.id, user: { name: nil, password_digest: user_to_edit.password_digest, level: user_to_edit.level}

				expect(response.status).to eq 302
				expect(response).to redirect_to admin_users_path
				expect(assigns(:user).errors.size).to_not eq 0
			end

			it ' cannot save a user without password_digest and redirects to users index' do
				user_to_edit = create(:user)
				patch :update_user, id: user_to_edit.id, user: { name: user_to_edit.name, password_digest: nil, level: user_to_edit.level}

				expect(response.status).to eq 302
				expect(response).to redirect_to admin_users_path
				expect(assigns(:user).errors.size).to_not eq 0
			end

			it ' cannot save a user without level and redirects to users index' do
				user_to_edit = create(:user)
				patch :update_user, id: user_to_edit.id, user: { name: user_to_edit.name, password_digest: user_to_edit.password_digest, level: nil }

				expect(response.status).to eq 302
				expect(response).to redirect_to admin_users_path
				expect(assigns(:user).errors.size).to_not eq 0
			end
		end

		describe "get#admin_courses" do
			it "responses with status OK" do
				get :admin_courses

				expect(response.status).to eq 200
			end
		end

		describe "post#create_course" do
			let(:new_course){ build(:course) }

			it "can create a course and redirects to admin courses" do
				post :create_course, course: { name: new_course.name, imageurl: new_course.imageurl, price: new_course.price, description: new_course.description, videourl: new_course.videourl}

				expect(response.status).to eq 302
				expect(response).to redirect_to admin_courses_path
			end

			it "cannot create a course without name" do
				post :create_course, course: { name: nil, imageurl: new_course.imageurl, price: new_course.price, description: new_course.description, videourl: new_course.videourl}

				expect(assigns(:course).errors.size).to_not eq 0
				expect(response.status).to eq 302
				expect(response).to redirect_to admin_courses_path
			end

			it "cannot create a course without price" do
				post :create_course, course: { name: new_course.name, imageurl: new_course.imageurl, price: nil, description: new_course.description, videourl: new_course.videourl}

				expect(assigns(:course).errors.size).to_not eq 0
				expect(response.status).to eq 302
				expect(response).to redirect_to admin_courses_path
			end

			it "cannot create two courses with same price" do
				second_course = create(:course)
				post :create_course, course: { name: new_course.name, imageurl: new_course.imageurl, price: second_course.price, description: new_course.description, videourl: new_course.videourl}

				expect(assigns(:course).errors.size).to_not eq 0
				expect(response.status).to eq 302
				expect(response).to redirect_to admin_courses_path
			end
		end

		describe "get#edit_course" do
			let(:course){ create(:course) }

			it "responses with status OK" do
				get :edit_course, id: course.id

				expect(response.status).to eq 200
			end
		end

		describe "patch#update_course" do
			let(:course){ create(:course) }

			it "can update a course and redirects to admin courses" do
				patch :update_course, id: course.id, course: { name: course.name, imageurl: "", price: course.price, videourl: "", description: "" }

				expect(assigns(:course).errors.size).to eq 0
				expect(response.status).to eq 302
				expect(response).to redirect_to admin_courses_path
			end

			it "cannot update a course without name" do
				patch :update_course, id: course.id, course: { name: nil, imageurl: "", price: course.price, videourl: "", description: "" }

				expect(assigns(:course).errors.size).to_not eq 0
				expect(response.status).to eq 302
				expect(response).to redirect_to admin_courses_path
			end

			it "cannot update a course without price" do
				patch :update_course, id: course.id, course: { name: course.name, imageurl: "", price: "", videourl: "", description: "" }

				expect(assigns(:course).errors.size).to_not eq 0
				expect(response.status).to eq 302
				expect(response).to redirect_to admin_courses_path
			end

			it "cannot update a course price that's equal than other course" do
				second_course = create(:course, price: 100)

				patch :update_course, id: course.id, course: { name: course.name, imageurl: "", price: second_course.price, videourl: "", description: "" }

				expect(assigns(:course).errors.size).to_not eq 0
				expect(response.status).to eq 302
				expect(response).to redirect_to admin_courses_path
			end
		end

		describe 'delete#delete_course' do
			let(:course){ create(:course) }

			it 'can delete a course' do
				delete :delete_course, id: course.id

				expect(response.status).to eq 302
				expect(response).to redirect_to admin_courses_path
			end
		end

		describe 'get#preview_course' do
			let(:course){ create(:course) }

			it 'responses with status ok' do
				get :preview_course, id: course.id

				expect(response.status).to eq 200
			end
		end

		describe 'get#new_media_file' do
			let(:course){create(:course)}

			it 'response with status OK' do
				get :new_media_file, id: course.id

				expect(response.status).to eq 200
			end
		end

		describe 'post#create_media_file' do
			let(:course){ create(:course) }
			let(:media_file){ create(:media_file) }

			it 'can create a media file' do
				post :create_media_file, id: course.id, media_file: { url: media_file.url, name: media_file.name }

				expect(assigns(:media_file).errors.size).to eq 0
				expect(response.status).to eq 302
				expect(response).to redirect_to show_media_files_path(course.id)
			end
		end

		describe 'get#show_media_files' do
			let(:course){ create(:course) }

			it 'response with status ok' do
				get :show_media_files, id: course.id

				expect(response.status).to eq 200
			end
		end

		describe 'get#show_media_files' do
			let(:media_file){ create(:media_file) }

			it 'responses with status ok' do
				get :edit_media_file, id: media_file.id

				expect(response.status).to eq 200
			end
		end

		describe 'patch#update_media_file' do
			let(:media_file){ create(:media_file) }

			it 'updates a media file and redirects to show media files' do
				patch :update_media_file, id: media_file.id, media_file: { name: media_file.name, url: media_file.url }

				expect(assigns(:media_file).errors.size).to eq 0
				expect(response.status).to eq 302
				expect(response).to redirect_to show_media_files_path(media_file.course_id)
			end

			it 'cannot update a media file without name' do
				patch :update_media_file, id: media_file.id, media_file: { name: nil, url: media_file.url }

				expect(assigns(:media_file).errors.size).to_not eq 0
				expect(response.status).to eq 302
				expect(response).to redirect_to show_media_files_path(media_file.course_id)
			end

			it 'cannot update a media file without url' do
				patch :update_media_file, id: media_file.id, media_file: { name: media_file.name, url: nil }

				expect(assigns(:media_file).errors.size).to_not eq 0
				expect(response.status).to eq 302
				expect(response).to redirect_to show_media_files_path(media_file.course_id)
			end
		end

		describe 'delete_media_file' do
			let(:media_file){ create(:media_file) }

			it 'delete a media file and redirects to show media files' do
				delete :delete_media_file, id: media_file.id

				expect(response.status).to eq 302
				expect(response).to redirect_to show_media_files_path(media_file.course_id)
			end
		end

		describe 'post#create_exam' do
			let(:course){ create(:course) }
			let(:new_exam){ build(:exam) }

			before do
				new_exam.course_id = course.id
			end

			it 'can create an exam and redirects to admin course' do
				post :create_exam, id: new_exam.course_id, exam: {title: new_exam.title, video: new_exam.video, level: new_exam.level, comment: new_exam.comment }

				expect(assigns(:exam).errors.size).to eq 0
				expect(response.status).to eq 302
				expect(response).to redirect_to show_exams_path(new_exam.course_id)
			end

			it 'can create an exam without video and comment and redirects to admin course' do
				post :create_exam, id: new_exam.course_id, exam: {title: new_exam.title, video: nil, level: new_exam.level, comment: nil }

				expect(assigns(:exam).errors.size).to eq 0
				expect(response.status).to eq 302
				expect(response).to redirect_to show_exams_path(new_exam.course_id)
			end

			it 'can create an exam without video and redirects to admin course' do
				post :create_exam, id: new_exam.course_id, exam: {title: new_exam.title, video: nil, level: new_exam.level, comment: new_exam.comment }

				expect(assigns(:exam).errors.size).to eq 0
				expect(response.status).to eq 302
				expect(response).to redirect_to show_exams_path(new_exam.course_id)
			end

			it 'cannot create a exam without title and redirects to admin course' do
				post :create_exam, id: new_exam.course_id, exam: {title: nil, video: new_exam.video, level: new_exam.level, comment: new_exam.comment }

				expect(assigns(:exam).errors.size).to_not eq 0
				expect(response.status).to eq 302
				expect(response).to redirect_to show_exams_path(new_exam.course_id)
			end

			it 'cannot create a exam without level and redirects to admin course' do
				post :create_exam, id: new_exam.course_id, exam: {title: new_exam.title, video: new_exam.video, level: nil, comment: new_exam.comment }

				expect(assigns(:exam).errors.size).to_not eq 0
				expect(response.status).to eq 302
				expect(response).to redirect_to show_exams_path(new_exam.course_id)
			end
		end

		describe 'get#show_exams' do
			let(:course){ create(:course) }

			it 'responses with status ok' do
				get :show_exams, id: course.id

				expect(response.status).to eq(200)
			end
		end

		describe 'get#edit_exam' do
			let(:exam_to_edit){ create(:exam) }

			it 'response with status OK' do
				get :edit_exam, id: exam_to_edit.id

				expect(response.status).to eq 200
			end
		end

		describe 'patch#update_exam' do
			let(:course){ create(:course_with_exams) }

			it 'update an exam and redirects to admin exams path' do
				exam_to_edit = course.exam.first

				patch :update_exam, id: exam_to_edit.id, exam: { title: 'NewTitle', video: exam_to_edit.video, level: exam_to_edit.level, comment: exam_to_edit.comment }

				expect(response.status).to eq 302
				expect(response).to redirect_to show_exams_path(exam_to_edit.course_id)
				expect(assigns(:exam).errors.size).to eq 0
			end

			it 'update an exam without video and comment and redirects to admin exams path' do
				exam_to_edit = course.exam.first

				patch :update_exam, id: exam_to_edit.id, exam: { title: exam_to_edit.title, video: nil, level: exam_to_edit.level, comment: nil }

				expect(response.status).to eq 302
				expect(response).to redirect_to show_exams_path(exam_to_edit.course_id)
				expect(assigns(:exam).errors.size).to eq 0
			end

			it 'cannot update an exam without title' do
				exam_to_edit = course.exam.first

				patch :update_exam, id: exam_to_edit.id, exam: { title: nil, video: exam_to_edit.video, level: exam_to_edit.level, comment: exam_to_edit.comment  }

				expect(response.status).to eq 302
				expect(response).to redirect_to show_exams_path(exam_to_edit.course_id)
				expect(assigns(:exam).errors.size).to_not eq 0
			end

			it 'cannot update an exam without level' do
				exam_to_edit = course.exam.first

				patch :update_exam, id: exam_to_edit.id, exam: { title: exam_to_edit.title, video: exam_to_edit.video, level: nil, comment: exam_to_edit.comment  }

				expect(response.status).to eq 302
				expect(response).to redirect_to show_exams_path(exam_to_edit.course_id)
				expect(assigns(:exam).errors.size).to_not eq 0
			end
		end

		describe 'delete#delete_exam' do
			let(:course){ create(:course_with_exams) }

			it 'deletes an exam and redirects to admin exams' do
				delete :delete_exam, id: course.exam.first.id

				expect(response.status).to eq 302
				expect(response).to redirect_to show_exams_path(course.id)
			end
		end

		describe 'get#new_question' do
			let(:exam_to_add_question){ create(:exam) }

			it 'response with status OK' do
				get :new_question, id: exam_to_add_question.id

				expect(response.status).to eq 200
			end
		end

		describe 'post#create_question' do
			let(:exam){ create(:exam) }
			let(:new_question){ build(:question) }

			it 'can create a question for an exam and redirects to admin exams' do
				post :create_question, id: exam.id, question: {title: new_question.title, answer: new_question.answer}

				expect(response.status).to eq 302
				expect(response).to redirect_to exam_questions_path(exam)
				expect(assigns(:question).errors.size).to eq 0
			end

			it 'cannot create a question without title' do
				post :create_question, id: exam.id, question: {title: nil, answer: new_question.answer}

				expect(response.status).to eq 302
				expect(response).to redirect_to exam_questions_path(exam)
				expect(assigns(:question).errors.size).to_not eq 0
			end
		end

		describe 'get#exam_questions' do
			let(:exam){create(:exam)}

			it 'response with status OK' do
				get :exam_questions, id: exam.id

				expect(response.status).to eq 200
			end
		end

		describe 'get#edit_question' do
			let(:question){create(:question)}

			it 'response with status OK' do
				get :edit_question, id: question

				expect(response.status).to eq 200
			end
		end

		describe 'patch#update_question' do
			let(:question){create(:question)}

			it 'can update a question and redirects to exam questions' do
				patch :update_question, id: question, question: { title: 'NewTitle', answer: true }

				expect(response.status).to eq 302
				expect(response).to redirect_to exam_questions_path(question.exam_id)
				expect(assigns(:question).errors.size).to eq 0
			end

			it 'cannot update a question without title' do
				patch :update_question, id: question, question: { title: nil, answer: true }

				expect(response.status).to eq 302
				expect(response).to redirect_to exam_questions_path(question.exam_id)
				expect(assigns(:question).errors.size).to_not eq 0
			end
		end

		describe 'delete#delete_question' do
			let(:exam_with_10_questions){create(:exam_with_questions)}

			it 'can delete a question and redirects to exams questions' do
				delete :delete_question, id: exam_with_10_questions.questions.first

				expect(response.status).to eq 302
				expect(response).to redirect_to exam_questions_path(exam_with_10_questions)
				expect(exam_with_10_questions.questions.count).to_not eq 10
			end
		end

		describe 'get#preview_exam' do
			let(:exam){ create(:exam) }
			it 'response with status OK' do
				get :preview_exam, id: exam.id

				expect(response.status).to eq 200
			end
		end

		describe 'get#new_answer' do
			let(:question){ create(:question) }

			it 'response with status OK' do
				get :new_answer, id: question.id

				expect(response.status).to eq(200)
			end
		end

		describe 'post#create_answer' do
			let(:question){ create(:question) }
			let(:answer){ build(:answer) }

			it 'creates an answer' do
				post :create_answer, id: question.id, answer: { title: answer.title , right: answer.right}

				expect(assigns(:answer).errors.size).to eq 0
			end

			it 'redirects to exam questions path' do
				post :create_answer, id: question.id, answer: { title: answer.title , right: answer.right}

				expect(response).to redirect_to exam_questions_path(question.exam_id)
			end
		end

		describe 'get#edit_answer' do
			let(:question_with_answers){ create(:question_with_answers) }

			it 'responses with status ok' do
				answer = question_with_answers.answer.first

				get :edit_answer, id: answer.id

				expect(response.status).to eq(200)
			end
		end

		describe 'patch#update_answer' do
			let(:question_with_answers){ create(:question_with_answers) }

			it 'update answer attributes' do
				answer = question_with_answers.answer.first

				patch :update_answer, id: answer.id, answer: { title: 'new title', right: answer.right }

				expect(assigns(:answer).errors.size).to eq 0
			end

			it 'redirects to exam questions' do
				answer = question_with_answers.answer.first

				patch :update_answer, id: answer.id, answer: { title: 'new title', right: answer.right }

				expect(response.status).to eq(302)
				expect(response).to redirect_to exam_questions_path(question_with_answers.exam_id)
			end
		end

		describe 'delete#delete_answer' do
			let(:question_with_answers){ create(:question_with_answers) }

			it 'redirects to exam questions' do
				answer = question_with_answers.answer.first

				patch :delete_answer, id: answer.id

				expect(response.status).to eq(302)
				expect(response).to redirect_to exam_questions_path(question_with_answers.exam_id)
			end

			it 'deletes an answer' do
				answer = question_with_answers.answer.first

				patch :delete_answer, id: answer.id

				expect(question_with_answers.answer.count).to_not eq 10
			end	
		end
	end
end