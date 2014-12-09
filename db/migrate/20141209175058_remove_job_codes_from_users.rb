class RemoveJobCodesFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :job_codes
  end
end
