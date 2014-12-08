class CreateJobTypesSkills < ActiveRecord::Migration
  def change
    create_table :job_types_skills do |t|
      t.column :job_type_id, :integer
      t.column :skill_id, :integer
    end
  end
end
