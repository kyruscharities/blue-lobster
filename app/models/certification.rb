class Certification < ActiveRecord::Base
  has_many :skill_values
  has_many :skills, -> { uniq }, through: :skill_values

  validates_presence_of :name
  validates_presence_of :category

  has_and_belongs_to_many :users

  def friendly_name
    "#{name} #{"(#{post_nominal})" if post_nominal?}"
  end

end
