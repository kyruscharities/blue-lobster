class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.text :description
      t.string :phone
      t.string :url
      t.string :address

      t.timestamps
    end
  end
end
