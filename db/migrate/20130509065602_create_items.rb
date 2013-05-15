class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :product_id
      t.string :product_type
      t.decimal :original_price
      t.decimal :final_price
      t.boolean :is_paid
      t.decimal :rule_id

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
