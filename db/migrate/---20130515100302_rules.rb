class Rules < ActiveRecord::Migration
  def self.up
    create_table :rules do |t|
      t.string :name
      t.float :rate
      t.integer :medical_scheme_id

      t.timestamps
    end
  end

  def self.down
    drop_table :rules
  end
end
end
