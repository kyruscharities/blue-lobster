class Program < ActiveRecord::Base
  has_and_belongs_to_many :job_types, join_table: 'job_types_programs'
  has_and_belongs_to_many :veteran_support_goals, join_table: 'programs_veteran_support_goals'
  validates_presence_of :name
  validates_presence_of :description

  def publish!
    self.update! published: true
  end

  def unpublish!
    self.update! published: false
  end
end
