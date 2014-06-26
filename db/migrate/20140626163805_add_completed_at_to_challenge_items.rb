class AddCompletedAtToChallengeItems < ActiveRecord::Migration
  def change
    add_column :challenge_items, :completed_at, :datetime
  end
end
