class CreateUsersVeteranSupportGoals < ActiveRecord::Migration
  def change
    create_table :users_veteran_support_goals do |t|
      t.integer :user_id
      t.integer :veteran_support_goal_id
    end
  end
end
