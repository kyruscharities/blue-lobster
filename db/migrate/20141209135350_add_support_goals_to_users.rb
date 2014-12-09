class AddSupportGoalsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :support_goals_freeform, :text
  end
end
