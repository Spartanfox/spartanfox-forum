class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :creator
      t.text :content
      t.references :topic, foreign_key: true

      # Friendly ID
      t.string  :slug
      t.timestamps
    end
    add_index :messages, :slug, :unique => true
  end
end
