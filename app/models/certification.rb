class Certification < ActiveRecord::Base

  validates_presence_of :name
  validates_presence_of :category

  has_and_belongs_to_many :users

end
