class ChangeJobProgramToProgram < ActiveRecord::Migration
  def change
    rename_table :job_programs, :programs if ActiveRecord::Base.connection.table_exists? 'job_programs'
  end
end
