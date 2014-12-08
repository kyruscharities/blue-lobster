class SkillValue < ActiveRecord::Base
  belongs_to :question
  belongs_to :skill
end
