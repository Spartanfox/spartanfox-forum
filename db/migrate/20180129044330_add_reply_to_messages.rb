class AddReplyToMessages < ActiveRecord::Migration

  def self.up
    change_table :messages do |m|
      m.references :message, foreign_key: true
    end
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end


end
