require 'test_helper'

class RuleSetTest < ActiveSupport::TestCase

  test "it combines several date statements to create mega-sql" do
    ruleset = RuleSet.new :name => "Super Sequel"
    2.times do
      rule = ruleset.rules.build
      rule.rule_template = RuleTemplate.new :match_type => "date", :fields => "created_at"
      rule.operator = "<"
      rule.value = "now"
      rule.field = "created_at"
    end
    assert_equal ["(created_at < NOW()) AND (created_at < NOW())"], ruleset.conditions
  end
  
  test "it combines several string statements to create mega sql" do
    ruleset = RuleSet.new :name => "Super Sequel"
    2.times do
      rule = ruleset.rules.build
      rule.rule_template = RuleTemplate.new :match_type => "string", :fields => "title"
      rule.operator = "like"
      rule.value = "monkey"
      rule.field = "title"
    end
    assert_equal ["(title LIKE ?) AND (title LIKE ?)", "%monkey%", "%monkey%"], ruleset.conditions
  end
  
  test "it generates sql from having one rule" do
    ruleset = RuleSet.new :name => "Super Sequel"

    rule = ruleset.rules.build
    rule.rule_template = RuleTemplate.new :match_type => "date", :fields => "created_at"
    rule.operator = "<"
    rule.value = "now"
    rule.field = "created_at"

    assert_equal ["(created_at < NOW())"], ruleset.conditions
  end
end
