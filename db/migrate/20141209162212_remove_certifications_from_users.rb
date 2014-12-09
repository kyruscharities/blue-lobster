class RemoveCertificationsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :certifications
  end
end
