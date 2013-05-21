class Admission < ActiveRecord::Migration
  def self.up
      t.string :product_id
      t.decimal :totalrpice
      t.datetime :start_date
      t.datetime :end_date
      t.decimal :ward_type
      t.integer :account_id

  end

  def self.down
  end
end
