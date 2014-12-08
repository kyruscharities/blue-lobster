class Answer < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user

  belongs_to :question
  validates_presence_of :question

  validates_numericality_of :score, greater_than: 0, less_than_or_equal_to: 5
end
