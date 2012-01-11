class CreateVideoUnlocks < ActiveRecord::Migration
  def change
    create_table :video_unlocks do |t|
      t.references :video
      t.references :user

      t.timestamps
    end
    add_index :video_unlocks, :video_id
    add_index :video_unlocks, :user_id
  end
end
