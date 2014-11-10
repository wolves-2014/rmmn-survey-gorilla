require 'faker'

Survey.create!(title: "Like me?", author_id: 1)
Question.create!(survey_id: 1, question_body: "Do you like me?")
