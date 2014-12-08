class Answer < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user

  belongs_to :question
  validates_presence_of :question

  validates_numericality_of :score, greater_than: 0, less_than_or_equal_to: 5
  validates :question_id, presence: true
  validates :question_id, uniqueness: { scope: :user_id }
  validates :user_id, presence: true

  def self.for_question_and_user(question, user)
    where(question_id: question.id, user_id: user.id).first
  end
end
