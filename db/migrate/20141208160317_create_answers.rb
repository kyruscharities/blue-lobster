class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :user
      t.references :question
      t.integer :score

      t.timestamps
    end
  end
end
