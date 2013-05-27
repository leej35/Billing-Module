class CreateAdmissions < ActiveRecord::Migration
  def self.up
    create_table :admissions do |t|
      t.string :product_id
      t.datetime :start_date
      t.datetime :end_date
      t.decimal :ward_type
      t.decimal :account_id
      t.decimal :totalprice

      t.timestamps
    end
  end

  def self.down
    drop_table :admissions
  end
end
