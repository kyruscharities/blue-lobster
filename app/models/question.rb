class Question < ActiveRecord::Base
  STYLES = ["scored", "yes_no"]

  has_many :skill_values, dependent: :destroy
  has_many :skills, -> { uniq }, through: :skill_values

  validates :question, presence: true
  validates :style, inclusion: { in: STYLES }
  #validates :skills, length: { minimum: 1 }

  has_many :answers, dependent: :destroy

  def answer_for!(user, options={})
    answers.create! options.merge({user: user})
  end

  def answer_for(user)
    answers.find_by_user_id(user.id)
  end

  def scored?
    style == "scored"
  end

  def self.answered_by(user)
    includes(:answers).where(answers: { user_id: user.id }).order(:id)
  end

  def self.unanswered_by(user)
    answered = answered_by(user).ids
    includes(:answers).order(:id).reject { |q| answered.include? q.id }
  end
end
