class RemoveFromMessages < ActiveRecord::Migration
  def self.up
    remove_column :messages, :creator
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
