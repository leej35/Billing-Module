class CreateServices < ActiveRecord::Migration
  def self.up
    create_table :services do |t|
      t.string :product_id
      t.string :name
      t.decimal :price
      t.string :service_type
      t.string :department
      t.float :version

      t.timestamps
    end
  end

  def self.down
    drop_table :services
  end
end
