class Question < ActiveRecord::Base
  has_many :skill_values
  has_many :skills, through: :skill_values
end
