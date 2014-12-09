class JobType < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :description
  has_and_belongs_to_many :skills
  has_and_belongs_to_many :programs, join_table: 'programs_job_types'
end
