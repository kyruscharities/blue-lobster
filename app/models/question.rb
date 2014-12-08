class Question < ActiveRecord::Base
  has_many :skill_values
  has_many :skills, -> { uniq }, through: :skill_values

  validates :question, presence: true
  #validates :skills, length: { minimum: 1 }

  has_many :answers

  def answer_for!(user, options={})
    answers.create! options.merge({user: user})
  end
end