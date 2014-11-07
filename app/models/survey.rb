class Survey < ActiveRecord::Base
  has_many :questions
  # has_many :participants, through: :questions, through: :responses, source: :participants
  has_many :responses, through: :questions

  belongs_to :author, class_name: "User"

  # Remember to create a migration!

  def takers
    self.questions.first.participants
  end

end
