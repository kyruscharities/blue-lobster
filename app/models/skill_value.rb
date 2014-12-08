class SkillValue < ActiveRecord::Base
  belongs_to :question
  validates_presence_of :question

  belongs_to :skill
  validates_presence_of :skill

  validates_presence_of :weight
  validates_numericality_of :weight, greater_than: 0

  validates_uniqueness_of :question_id, :scope => :skill_id

  after_initialize :init

  def init
    self.weight ||= 10
  end
end
