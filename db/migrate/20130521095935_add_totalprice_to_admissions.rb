class AddTotalpriceToAdmissions < ActiveRecord::Migration
  def self.up
    add_column :admissions, :totalprice, :decimal
  end

  def self.down
    remove_column :admissions, :totalprice
  end
end
