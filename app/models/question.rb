class Question < ActiveRecord::Base
  has_many :responses
  has_many :participants, through: :responses, source: :user

  belongs_to :survey
  # Remember to create a migration!
end
