class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.integer :user_id
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
