class MilitaryJobCode < ActiveRecord::Base

  validates_presence_of :service
  validates_presence_of :mpc
  validates_presence_of :status
  validates_presence_of :code
  validates_presence_of :title
  validates_presence_of :onetcode
  
end
