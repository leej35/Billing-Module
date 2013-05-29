class AddRuleIdToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :rule_id, :decimal
  end

  def self.down
    remove_column :items, :rule_id
  end
end
