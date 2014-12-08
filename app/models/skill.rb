class Skill < ActiveRecord::Base
  validates_presence_of :name
  has_and_belongs_to_many :job_types
  has_many :skill_values
end
