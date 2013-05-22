class AddAccountIdToPayments < ActiveRecord::Migration
  def self.up
    add_column :payments, :account_id, :decimal
  end

  def self.down
    remove_column :payments, :account_id
  end
end
