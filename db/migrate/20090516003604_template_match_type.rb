class TemplateMatchType < ActiveRecord::Migration
  def self.up
    add_column :rule_templates, :match_type, :string
  end

  def self.down
    remove_column :rule_templates, :match_type
  end
end
