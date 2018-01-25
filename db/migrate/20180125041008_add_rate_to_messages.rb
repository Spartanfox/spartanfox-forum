class AddRateToMessages < ActiveRecord::Migration

  def self.up
    add_column    :messages, :rating, :integer, default: 0
  end

  def self.down
    remove_column :messages, :rating, :integer, default: 0
  end

end
