class CreateMilitaryJobCodes < ActiveRecord::Migration
  def change
    create_table :military_job_codes do |t|
      t.string :service
      t.string :mpc
      t.string :status
      t.string :code
      t.text :title
      t.string :onetcode
      t.text :onettitle

      t.timestamps
    end
  end
end
