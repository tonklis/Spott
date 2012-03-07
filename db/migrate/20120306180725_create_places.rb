class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :u_id
      t.string :category_u_id
      t.string :name
      t.string :description
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
