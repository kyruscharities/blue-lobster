class CreateMilitaryJobCodesUsers < ActiveRecord::Migration
  def change
    create_table :military_job_codes_users do |t|
      t.integer :military_job_code_id
      t.integer :user_id
    end
  end
end
