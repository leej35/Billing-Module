class AccountMedicalSchemes < ActiveRecord::Migration
  def self.up
    create_table :accounts_medical_schemes do |t|
      t.integer :account_id
      t.integer :medical_scheme_id
      t.timestamps
	end
  end

  def self.down
  end
end
