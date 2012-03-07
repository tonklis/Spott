class CreateDfiles < ActiveRecord::Migration
  def change
    create_table :dfiles do |t|
      t.string :u_id
      t.integer :user_id
      t.integer :place_id
      t.string :name
      t.string :description
      t.string :location
      t.string :type

      t.timestamps
    end
  end
end
