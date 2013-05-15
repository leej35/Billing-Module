class CreateAccountItemLists < ActiveRecord::Migration
  def self.up
    create_table :account_item_lists do |t|
      t.decimal :account_id
      t.decimal :item_id

      t.timestamps
    end
  end

  def self.down
    drop_table :account_item_lists
  end
end
