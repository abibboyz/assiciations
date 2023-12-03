class CreateImages < ActiveRecord::Migration[7.1]
  def change
    create_table :images do |t|
      t.string :url
      t.integer :imageable_id
      t.string :imageable_type

      t.timestamps
    end
  end
end
