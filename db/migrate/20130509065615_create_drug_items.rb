class CreateDrugItems < ActiveRecord::Migration
  def self.up
    create_table :drug_items do |t|
      t.string :product_id
      t.string :name
      t.decimal :price
      t.string :drug_type
      t.double :version

      t.timestamps
    end
  end

  def self.down
    drop_table :drug_items
  end
end
