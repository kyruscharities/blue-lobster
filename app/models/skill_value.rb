class SkillValue < ActiveRecord::Base
  belongs_to :question
  belongs_to :certification
  belongs_to :military_job_code

  belongs_to :skill
  validates_presence_of :skill

  validates_presence_of :weight
  validates_numericality_of :weight, greater_than: 0

  #validates_uniqueness_of :question_id, :scope => :skill_id

  after_initialize :init

  def init
    self.weight ||= 10
  end
end
