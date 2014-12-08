class Question < ActiveRecord::Base
  #has_many :skill_values
  #has_many :skills, through: :skill_values

  validates :question, presence: true
  #validates :skills, length: { minimum: 1 }
end
