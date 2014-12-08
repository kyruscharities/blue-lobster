class JobProgram < ActiveRecord::Base
  has_and_belongs_to_many :job_types, join_table: 'job_programs_job_types'
  validates_presence_of :name
  validates_presence_of :description
end
