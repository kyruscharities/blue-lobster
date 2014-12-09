class AddLastSentToUser < ActiveRecord::Migration
  def change
      add_column :users, :email_interval_last, :datetime
  end
end
