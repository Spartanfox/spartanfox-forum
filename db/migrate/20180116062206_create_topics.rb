class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :creator
      t.string :title
      t.text :content
      t.references :category, foreign_key: true
      # Friendly ID
      t.string  :slug
      t.timestamps
    end
    add_index :topics, :slug, :unique => true
  end
end
