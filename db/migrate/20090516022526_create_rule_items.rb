class CreateRuleItems < ActiveRecord::Migration
  def self.up
    create_table :rule_items do |t|
      t.integer :rule_id
      t.integer :rule_set_id
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :rule_items
  end
end
