class AddCertificationMilitaryJobCodeToSkillValue < ActiveRecord::Migration
  def change
    add_column :skill_values, :certification_id, :integer
    add_column :skill_values, :military_job_code_id, :integer
  end
end
