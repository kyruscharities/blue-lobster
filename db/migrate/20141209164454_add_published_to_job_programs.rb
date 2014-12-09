class AddPublishedToJobPrograms < ActiveRecord::Migration
  def change
    add_column :job_programs, :published, :boolean, default: false
  end
end
