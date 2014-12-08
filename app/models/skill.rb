class Skill < ActiveRecord::Base
  has_and_belongs_to_many :job_types
  has_many :skill_values

  validates_presence_of :name
end
