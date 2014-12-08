class SkillValue < ActiveRecord::Base
  belongs_to :question
  belongs_to :skill

  validates :weight, presence: true
  validates :question, presence: true
  validates :skill, presence: true
end
