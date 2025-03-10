class CreateSongs < ActiveRecord::Migration[8.0]
  def change
    create_table :songs do |t|
      t.string :name
      t.text :lyrics

      t.timestamps
    end
  end
end
