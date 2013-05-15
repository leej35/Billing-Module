class CreateSchemeProviders < ActiveRecord::Migration
  def self.up
    create_table :scheme_providers do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :scheme_providers
  end
end
