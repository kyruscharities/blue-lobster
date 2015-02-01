class Organization < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :phone
  validates_presence_of :url

  has_many :programs
end
