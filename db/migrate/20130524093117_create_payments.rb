class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.decimal :pay_type
      t.float :amount
      t.decimal :user_id
      t.decimal :account_id

      t.timestamps
    end
  end

  def self.down
    drop_table :payments
  end
end
