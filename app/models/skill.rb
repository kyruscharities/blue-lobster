class Skill < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :job_type
end
