class RemoveTotalrpiceFromAdmissions < ActiveRecord::Migration
  def self.up
    remove_column :admissions, :totalrpice
  end

  def self.down
    add_column :admissions, :totalrpice, :decimal
  end
end
