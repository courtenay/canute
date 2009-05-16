class CreateRules < ActiveRecord::Migration
  def self.up
    create_table :rules do |t|
      t.integer :rule_template_id
      t.string :field
      t.string :operator
      t.string :value

      t.timestamps
    end
  end

  def self.down
    drop_table :rules
  end
end
