class CreateJobTypeToJobProgram < ActiveRecord::Migration
  def change
    create_table :job_types_programs do |t|
      t.column :program_id, :integer
      t.column :job_type_id, :integer
    end
  end
end
