class AddProfileCompleteToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile_complete, :boolean, default: false
  end
end
