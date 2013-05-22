class Admission < ActiveRecord::Migration
  def self.up
    create_table :admissions do |t|
      t.string :product_id
      t.decimal :totalprice
      t.datetime :start_date
      t.datetime :end_date
      t.decimal :ward_type
      t.integer :account_id

      t.timestamps
    end
  end

  def self.down
    drop_table :admission 
  end
end
