class CreateChallengeItems < ActiveRecord::Migration
  def change
    create_table :challenge_items do |t|
      t.references :challenge, index: true
      t.string :content

      t.timestamps
    end
  end
end
