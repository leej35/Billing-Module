class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.int :patient_id
      t.float :balance

      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
