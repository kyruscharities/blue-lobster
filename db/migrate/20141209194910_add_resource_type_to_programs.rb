class AddResourceTypeToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :resource_type, :string
  end
end
