class RuleBelongsToSet < ActiveRecord::Migration
  def self.up
    add_column :rules, :position, :integer
    add_column :rules, :rule_set_id, :integer
  end

  def self.down
    remove_column :rules, :rule_set_id
    remove_column :rules, :position
  end
end
