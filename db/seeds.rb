User.create!(name: "admin", password: "12345678", level: "Admin")
User.create!(name: "user1", password: "12345678", level: "1")
User.create!(name: "user2", password: "12345678", level: "2")
User.create!(name: "user3", password: "12345678", level: "3")

(1..3).each do |t|
	first = Exam.create!(title: "First exam for level #{t}", level: t.to_s, video: "https://www.youtube.com/watch?v=g6p7eTejWRY", comment: "Comment for first exam level #{t}")
	second = Exam.create!(title: "Second exam for level #{t}", level: t.to_s, video: "https://www.youtube.com/watch?v=g6p7eTejWRY", comment: "Comment for second exam level #{t}")
	Question.create!(title: "First question for first exam level #{t}", answer: true, exam_id: first.id)
	Question.create!(title: "Second question for first exam level #{t}", answer: false, exam_id: first.id)
	Question.create!(title: "First question for second exam level #{t}", answer: true, exam_id: second.id)
	Question.create!(title: "Second question for second exam level #{t}", answer: false, exam_id: second.id)
end