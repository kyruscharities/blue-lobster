class AddAccessCodeToProgram < ActiveRecord::Migration
  def change
    add_column :programs, :access_code, :string
  end
end
