User.create!(name: "admin", email: "admin@test.com", password: "12345678", password_digest: "12345678", gender: 'Male', level: "Admin")
User.create!(name: "user1", email: "user1@test.com", password: "12345678", password_digest: "12345678", gender: 'Male', level: "1")
User.create!(name: "user2", email: "user2@test.com", password: "12345678", password_digest: "12345678", gender: 'Male', level: "2")
User.create!(name: "user3", email: "user3@test.com", password: "12345678", password_digest: "12345678", gender: 'Male', level: "3")

(1..3).each do |t|
	first = Exam.create!(position: (1+t), title: "First exam for level #{t}", level: t.to_s, video: "https://www.youtube.com/watch?v=g6p7eTejWRY", comment: "Comment for first exam level #{t}")
	second = Exam.create!(position: (2+t), title: "Second exam for level #{t}", level: t.to_s, video: "https://www.youtube.com/watch?v=g6p7eTejWRY", comment: "Comment for second exam level #{t}")
	Question.create!(title: "First question for first exam level #{t}", answer: true, exam_id: first.id)
	Question.create!(title: "Second question for first exam level #{t}", answer: false, exam_id: first.id)
	Question.create!(title: "First question for second exam level #{t}", answer: true, exam_id: second.id)
	Question.create!(title: "Second question for second exam level #{t}", answer: false, exam_id: second.id)
end