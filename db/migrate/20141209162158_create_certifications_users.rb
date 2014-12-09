class CreateCertificationsUsers < ActiveRecord::Migration
  def change
    create_table :certifications_users do |t|
      t.column :certification_id, :integer
      t.column :user_id, :integer
    end
  end
end
