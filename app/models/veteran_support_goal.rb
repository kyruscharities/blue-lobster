class VeteranSupportGoal < ActiveRecord::Base
  has_and_belongs_to_many :programs, join_table: 'programs_veterans_support_goals' 
  validates_presence_of :description
end
