class JobProgram < ActiveRecord::Base
  has_many :job_type
  validates_presence_of :name
  validates_presence_of :description
end
