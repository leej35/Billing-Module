class AddPaymentIdToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :payment_id, :decimal
  end

  def self.down
    remove_column :items, :payment_id
  end
end
