class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :age_range, :string
    add_column :users, :status, :string
    add_column :users, :services, :text
    add_column :users, :certifications, :text
    add_column :users, :job_codes, :text
    add_column :users, :support_goals, :text
  end
end
