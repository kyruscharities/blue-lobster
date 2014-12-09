class ChangeJobProgramToProgram < ActiveRecord::Migration
  def change
    rename_table :job_programs, :programs
  end
end
