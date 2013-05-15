class CreateWardTypes < ActiveRecord::Migration
  def self.up
    create_table :ward_types do |t|
      t.string :ward_type
      t.decimal :daily_price
      t.double :version

      t.timestamps
    end
  end

  def self.down
    drop_table :ward_types
  end
end
