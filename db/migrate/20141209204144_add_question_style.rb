class AddQuestionStyle < ActiveRecord::Migration
  def change
    change_table :questions do |t|
      t.string :style
    end

    Question.all.each do |q|
      q.style = "scored"
      q.save!
    end
  end
end
