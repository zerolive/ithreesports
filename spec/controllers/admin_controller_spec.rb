require 'rails_helper'

RSpec.describe AdminController, type: :controller do
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
			post :create_user, user: {name: new_user.name, password: new_user.password, level: new_user.level}

			expect(response.status).to eq 302
			expect(assigns(:user).errors.size).to eq 0
			expect(response).to redirect_to admin_users_path
		end

		it 'cannot create a user without level' do
			post :create_user, user: {name: new_user.name, password: new_user.password, level: nil}

			expect(response.status).to eq 302
			expect(response).to redirect_to admin_users_path
			expect(assigns(:user).errors.size).to_not eq 0
		end

		it 'cannot create a user without password' do
			post :create_user, user: {name: new_user.name, password: nil, level: new_user.level}

			expect(response.status).to eq 302
			expect(response).to redirect_to admin_users_path
			expect(assigns(:user).errors.size).to_not eq 0
		end

		it 'cannot create a user without name' do
			post :create_user, user: {name: nil, password: new_user.password, level: new_user.level}

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
			patch :update_user, id: user_to_edit.id, user: { name: 'NewName', password: user_to_edit.password, level: user_to_edit.level}

			expect(response.status).to eq 302
			expect(response).to redirect_to admin_users_path
			expect(assigns(:user).name).to eq 'NewName'
			expect(assigns(:user).errors.size).to eq 0
		end

		it ' cannot save a user without name and redirects to users index' do
			user_to_edit = create(:user)
			patch :update_user, id: user_to_edit.id, user: { name: nil, password: user_to_edit.password, level: user_to_edit.level}

			expect(response.status).to eq 302
			expect(response).to redirect_to admin_users_path
			expect(assigns(:user).errors.size).to_not eq 0
		end

		it ' cannot save a user without password and redirects to users index' do
			user_to_edit = create(:user)
			patch :update_user, id: user_to_edit.id, user: { name: user_to_edit.name, password: nil, level: user_to_edit.level}

			expect(response.status).to eq 302
			expect(response).to redirect_to admin_users_path
			expect(assigns(:user).errors.size).to_not eq 0
		end

		it ' cannot save a user without level and redirects to users index' do
			user_to_edit = create(:user)
			patch :update_user, id: user_to_edit.id, user: { name: user_to_edit.name, password: user_to_edit.password, level: nil }

			expect(response.status).to eq 302
			expect(response).to redirect_to admin_users_path
			expect(assigns(:user).errors.size).to_not eq 0
		end
	end

	describe 'get#admin_exams' do
		it 'response with status OK' do
			get :admin_exams

			expect(response.status).to eq 200
		end
	end

	describe 'post#create_exam' do
		let(:new_exam){ build(:exam) }

		it 'can create an exam and redirects to admin course' do
			post :create_exam, exam: {title: new_exam.title, video: new_exam.video, level: new_exam.level, comment: new_exam.comment }

			expect(assigns(:exam).errors.size).to eq 0
			expect(response.status).to eq 302
			expect(response).to redirect_to admin_exams_path
		end

		it 'can create an exam without video and comment and redirects to admin course' do
			post :create_exam, exam: {title: new_exam.title, video: nil, level: new_exam.level, comment: nil }

			expect(assigns(:exam).errors.size).to eq 0
			expect(response.status).to eq 302
			expect(response).to redirect_to admin_exams_path
		end

		it 'can create an exam without video and redirects to admin course' do
			post :create_exam, exam: {title: new_exam.title, video: nil, level: new_exam.level, comment: new_exam.comment }

			expect(assigns(:exam).errors.size).to eq 0
			expect(response.status).to eq 302
			expect(response).to redirect_to admin_exams_path
		end

		it 'cannot create a exam without title and redirects to admin course' do
			post :create_exam, exam: {title: nil, video: new_exam.video, level: new_exam.level, comment: new_exam.comment }

			expect(assigns(:exam).errors.size).to_not eq 0
			expect(response.status).to eq 302
			expect(response).to redirect_to admin_exams_path
		end

		it 'cannot create a exam without level and redirects to admin course' do
			post :create_exam, exam: {title: new_exam.title, video: new_exam.video, level: nil, comment: new_exam.comment }

			expect(assigns(:exam).errors.size).to_not eq 0
			expect(response.status).to eq 302
			expect(response).to redirect_to admin_exams_path
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
		let(:exam_to_edit){ create(:exam) }

		it 'update an exam and redirects to admin exams path' do
			patch :update_exam, id: exam_to_edit.id, exam: { title: 'NewTitle', video: exam_to_edit.video, level: exam_to_edit.level, comment: exam_to_edit.comment }

			expect(response.status).to eq 302
			expect(response).to redirect_to admin_exams_path
			expect(assigns(:exam).errors.size).to eq 0
		end

		it 'update an exam without video and comment and redirects to admin exams path' do
			patch :update_exam, id: exam_to_edit.id, exam: { title: exam_to_edit.title, video: nil, level: exam_to_edit.level, comment: nil }

			expect(response.status).to eq 302
			expect(response).to redirect_to admin_exams_path
			expect(assigns(:exam).errors.size).to eq 0
		end

		it 'cannot update an exam without title' do
			patch :update_exam, id: exam_to_edit.id, exam: { title: nil, video: exam_to_edit.video, level: exam_to_edit.level, comment: exam_to_edit.comment  }

			expect(response.status).to eq 302
			expect(response).to redirect_to admin_exams_path
			expect(assigns(:exam).errors.size).to_not eq 0
		end

		it 'cannot update an exam without level' do
			patch :update_exam, id: exam_to_edit.id, exam: { title: exam_to_edit.title, video: exam_to_edit.video, level: nil, comment: exam_to_edit.comment  }

			expect(response.status).to eq 302
			expect(response).to redirect_to admin_exams_path
			expect(assigns(:exam).errors.size).to_not eq 0
		end
	end

	describe 'delete#delete_exam' do
		let(:exam_to_delete){ create(:exam) }

		it 'deletes an exam and redirects to admin exams' do
			delete :delete_exam, id: exam_to_delete.id

			expect(response.status).to eq 302
			expect(response).to redirect_to admin_exams_path
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

		it 'cannot create a question without answer' do
			post :create_question, id: exam.id, question: {title: new_question.title, answer: nil}

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

		it 'cannot update a question without answer' do
			patch :update_question, id: question, question: { title: 'NewTitle', answer: nil }

			expect(response.status).to eq 302
			expect(response).to redirect_to exam_questions_path(question.exam_id)
			expect(assigns(:question).errors.size).to_not eq 0
		end
	end
end