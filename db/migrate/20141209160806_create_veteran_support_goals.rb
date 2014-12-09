class CreateVeteranSupportGoals < ActiveRecord::Migration
  def change
    create_table :veteran_support_goals do |t|
      t.text :description

      t.timestamps
    end
  end
end
