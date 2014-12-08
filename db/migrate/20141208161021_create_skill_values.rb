class CreateSkillValues < ActiveRecord::Migration
  def change
    create_table :skill_values do |t|
      t.integer :weight, null: false
      t.references :question
      t.references :skill
      t.timestamps
    end
  end
end
