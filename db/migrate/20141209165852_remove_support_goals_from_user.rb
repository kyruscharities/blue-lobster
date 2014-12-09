class RemoveSupportGoalsFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :support_goals
  end
end
