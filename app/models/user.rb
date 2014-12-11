class User < ActiveRecord::Base
  include UsersHelper

  GENDERS = ['Male', 'Female']
  AGES = ['18-25', '26-35', '35-45', '46-55', '56-65', '66+']
  EMAIL_INTERVALS = [0, 1, 7, 30]
  STATUSES = ['Active Duty', 'Reserves', 'Veteran', 'Family member']
  SERVICES = ['Army', 'Marines', 'Navy', 'Air Force', 'Coast Guard',
              'National Guard']

  rolify
  include Gravtastic
  gravtastic size: 300

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :answers, dependent: :destroy
  has_and_belongs_to_many :certifications
  has_and_belongs_to_many :veteran_support_goals
  has_and_belongs_to_many :military_job_codes

  serialize :services, Array

  validates_presence_of :gender, if: :veteran?
  validates_inclusion_of :gender, in: GENDERS, allow_nil: true

  validates_inclusion_of :age_range, in: AGES, allow_nil: true

  validates_inclusion_of :email_interval, in: EMAIL_INTERVALS, allow_nil: true

  validates_inclusion_of :status, in: STATUSES, allow_nil: true

  #validates_inclusion_of :services, in: SERVICES, allow_nil: true

  validates_format_of :zip, with: /\A\d{5}(-\d{4})?\z/, message: "should be in the form 12345 or 12345-1234", allow_nil: true

  after_create :default_role

  before_validation :default_interval

  validates_presence_of :name
  validates_presence_of :email_interval_last, allow_nil: true

  def veteran?
    roles.include? ['veteran']
  end

  def location
    ret = ''
    ret += "#{city}, " if city
    ret += "#{state_from_code(state) }, " if state
    ret += "#{zip}" if zip
    ret
  end

  def bio_string
    "#{age_range} year old #{gender.try :downcase} from #{location}"
  end

  def get_skill_buckets
    skill_buckets = Hash.new 0

    for ans in self.answers
      p ans

      for val in ans.question.skill_values
        p val
        skill_buckets[val.skill] += (ans.score * val.weight)
      end
    end

    for cert in self.certifications
      for val in cert.skill_values
        skill_buckets[val.skill] += val.weight
      end
    end

    for moc in self.military_job_codes
      for val in moc.skill_values
        skill_buckets[val.skill] += val.weight
      end
    end

    return skill_buckets
  end

  def normalized_skills
    skill_buckets = get_skill_buckets.sort_by{|k,v| v}.reverse
    if skill_buckets.empty?
      []
    else
      normalizer = 100.0 / skill_buckets.first.last
      skill_buckets.collect {|k, v| [k, v, v * normalizer]}
    end
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

  def answered_questions?
    answers.present?
  end

  def self.send_emails
    User.find_each do |user|
      if user.email_interval != 0
        if user.email_interval_last = 0
          user.email_interval_last = Time.now
        end
        if (user.email_interval_last + user.email_interval.days) < Time.now
          ProgramMailer.program_mailer(user).deliver
          user.email_interval_last = Time.now
        end
      end
    end
  end

  def default_interval
    self.email_interval ||= 30
  end

  private

  def default_role
    add_role :veteran
  end
end
