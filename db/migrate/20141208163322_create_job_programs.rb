class CreateJobPrograms < ActiveRecord::Migration
  def change
    create_table :job_programs do |t|
      t.string :description
      t.string :name

      t.timestamps
    end
  end
end
