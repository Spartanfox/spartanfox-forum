class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
      t.string :name
      t.string :download_type
      t.string :download_address
      t.integer :downloads_count
      t.text :info
      t.integer :ordinal
      # Friendly ID
      t.string  :slug
      t.timestamps
    end
    add_index :downloads, :slug, :unique => true
  end
end
