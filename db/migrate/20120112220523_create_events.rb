class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :user
      t.string :fb_id
      t.string :name
      t.string :description
      t.datetime :updated_time
      t.datetime :start_time
      t.datetime :end_time
      t.string :location

      t.timestamps
    end
    add_index :events, :user_id
  end
end
