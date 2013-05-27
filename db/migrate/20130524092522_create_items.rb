class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :name
      t.string :product_id
      t.string :product_type
      t.float :original_price
      t.float :final_price
      t.boolean :is_paid
      t.decimal :account_id
      t.decimal :payment_id

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
