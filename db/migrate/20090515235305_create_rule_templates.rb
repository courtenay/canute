class CreateRuleTemplates < ActiveRecord::Migration
  def self.up
    create_table :rule_templates do |t|
      t.string :name
      t.string :description
      t.string :fields

      t.timestamps
    end
  end

  def self.down
    drop_table :rule_templates
  end
end
