class CreateAccountSchemes < ActiveRecord::Migration
  def self.up
    create_table :account_schemes do |t|
      t.decimal :account_id
      t.decimal :medical_scheme_id

      t.timestamps
    end
  end

  def self.down
    drop_table :account_schemes
  end
end
