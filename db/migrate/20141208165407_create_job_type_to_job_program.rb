class CreateJobTypeToJobProgram < ActiveRecord::Migration
  def change
    create_table :job_programs_job_types do |t|
      t.column :job_program_id, :integer
      t.column :job_type_id, :integer
    end
  end
end