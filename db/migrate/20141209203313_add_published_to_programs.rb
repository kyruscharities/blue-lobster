class AddPublishedToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :published, :boolean, default: true
  end
end
