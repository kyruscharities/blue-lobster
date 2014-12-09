class AddIntervalToUser < ActiveRecord::Migration
  def change
    add_column :users, :email_interval, :integer
  end
end
