class AddNameToPayType < ActiveRecord::Migration
  def self.up
    add_column :pay_types, :name, :string
  end

  def self.down
    remove_column :pay_types, :name
  end
end
