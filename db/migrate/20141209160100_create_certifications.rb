class CreateCertifications < ActiveRecord::Migration
  def change
    create_table :certifications do |t|
      t.string :name
      t.string :category
      t.string :post_nominal

      t.timestamps
    end
  end
end
