class MilitaryJobCode < ActiveRecord::Base

  validates_presence_of :service
  validates_presence_of :mpc
  validates_presence_of :status
  validates_presence_of :code
  validates_presence_of :title
  validates_presence_of :onetcode

  has_and_belongs_to_many :users

  def friendly_name
    "#{title} (#{code})"
  end

end
