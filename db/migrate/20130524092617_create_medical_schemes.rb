class CreateMedicalSchemes < ActiveRecord::Migration
  def self.up
    create_table :medical_schemes do |t|
      t.string :name
      t.string :provider
      t.string :scheme_type

      t.timestamps
    end
  end

  def self.down
    drop_table :medical_schemes
  end
end
