class CreateProgramsVeteranSupportGoals < ActiveRecord::Migration
  def change
    create_table :programs_veteran_support_goals do |t|
      t.column :program_id, :integer
      t.column :veteran_support_goal_id, :integer
    end
  end
end
