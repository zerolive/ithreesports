User.create!(name: "admin", email: "admin@test.com", password: "12345678", password_digest: "12345678", gender: 'Male', level: "Admin")
User.create!(name: "user1", email: "user1@test.com", password: "12345678", password_digest: "12345678", gender: 'Male', level: "User")
User.create!(name: "user2", email: "user2@test.com", password: "12345678", password_digest: "12345678", gender: 'Male', level: "User")
User.create!(name: "user3", email: "user3@test.com", password: "12345678", password_digest: "12345678", gender: 'Male', level: "User")

first_course = Course.create!(name: "First course", imageurl: "http://thumbs1.ebaystatic.com/d/l225/pict/281952688656_-1.jpg", price: 10, description: "Description for first course", videourl: "https://www.youtube.com/watch?v=iL0m5XRkdtg")
								MediaFile.create!(course_id: first_course.id, url: "http://thumbs1.ebaystatic.com/d/l225/pict/281952688656_-1.jpg", video: "0")
								MediaFile.create!(course_id: first_course.id, url: "https://www.youtube.com/watch?v=iL0m5XRkdtg", video: "1")
second_course = Course.create!(name: "Second course", imageurl: "http://www.heyboitila.com/wp-content/uploads/2014/09/SECOND-COURSE-ARCHIVO-ESPANOL1.jpg", price: 20, description: "Description for second course", videourl: "https://www.youtube.com/watch?v=TZhfJ0maZ2E")
								MediaFile.create!(course_id: second_course.id, url: "http://www.heyboitila.com/wp-content/uploads/2014/09/SECOND-COURSE-ARCHIVO-ESPANOL1.jpg", video: "0")
								MediaFile.create!(course_id: second_course.id, url: "https://www.youtube.com/watch?v=TZhfJ0maZ2E", video: "1")
third_course = Course.create!(name: "Third course", imageurl: "http://cdn.rainbowresource.netdna-cdn.com/products/047825.jpg", price: 30, description: "Description for thrid course", videourl: "https://www.youtube.com/watch?v=k6BQ-uTo_TI")
								MediaFile.create!(course_id: third_course.id, url: "http://cdn.rainbowresource.netdna-cdn.com/products/047825.jpg", video: "0")
								MediaFile.create!(course_id: third_course.id, url: "https://www.youtube.com/watch?v=k6BQ-uTo_TI", video: "1")

first_exam = Exam.create!(position: 1, title: "First exam for course", level: "User", video: "https://www.youtube.com/watch?v=g6p7eTejWRY", comment: "Comment for first exam course", course_id: third_course.id)
	first_question_first_exam = Question.create!(title: "First question for first exam course", exam_id: first_exam.id)
		Answer.create!(question_id: first_question_first_exam.id, title: 'Answer 1', right: '0')
		Answer.create!(question_id: first_question_first_exam.id, title: 'Answer 2', right: '0')
		Answer.create!(question_id: first_question_first_exam.id, title: 'Answer 3', right: '1')
		Answer.create!(question_id: first_question_first_exam.id, title: 'Answer 4', right: '0')
	second_question_first_exam = Question.create!(title: "Second question for first exam course", exam_id: first_exam.id)
		Answer.create!(question_id: second_question_first_exam.id, title: 'Answer 1', right: '0')
		Answer.create!(question_id: second_question_first_exam.id, title: 'Answer 2', right: '0')
		Answer.create!(question_id: second_question_first_exam.id, title: 'Answer 3', right: '1')
		Answer.create!(question_id: second_question_first_exam.id, title: 'Answer 4', right: '0')