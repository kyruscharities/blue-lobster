class Skill < ActiveRecord::Base
  has_and_belongs_to_many :job_types
  has_many :skill_values, dependent: :destroy

  validates_presence_of :name
end
