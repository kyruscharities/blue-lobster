class User < ActiveRecord::Base
  rolify
  include Gravtastic
  gravtastic

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :answers

  after_create :default_role

  validates_presence_of :name
  
  def get_skill_buckets
    skill_buckets = Hash.new 0
    
    for ans in self.answers
      p ans

      for val in ans.question.skill_values
        p val
        skill_buckets[val.skill] += (ans.score * val.weight)
      end
    end

    return skill_buckets
  end

  def normalized_skills
    skill_buckets = get_skill_buckets.sort_by{|k,v| v}.reverse
    normalizer = 100.0 / skill_buckets.first.last
    skill_buckets.collect {|k, v| [k, v, v * normalizer]}
  end

  def get_job_types
    job_buckets = Hash.new 0
    skill_buckets = self.get_skill_buckets 

    for jt in JobType.all
      p jt
      p jt.skills
      
      for skill in jt.skills
        p skill
        job_buckets[jt] += skill_buckets[skill]
      end
    end

    return job_buckets 
  end

  def matching_job_types_by_skill_level
    get_job_types.sort_by { |key, value| value }.reverse
  end

  validates_format_of :zip, with: /\A\d{5}(-\d{4})?\z/, message: "should be in the form 12345 or 12345-1234", allow_nil: true

  private

  def default_role
    add_role :veteran
  end
end
