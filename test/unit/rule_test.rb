require 'test_helper'

class RuleTest < ActiveSupport::TestCase

  test "it sanitizes dates into sql" do
    rule = Rule.new
    conversions = { 
      '2009-12-1' => "DATE('2009-12-1')",
      '12/4/2008' => "DATE('2008-12-4')",
      'today'     => "NOW()",
      'now'       => "NOW()",
      '1 week ago' => '(NOW() - INTERVAL 1 week)',
      '2 months ago' => '(NOW() - INTERVAL 2 month)' }
    conversions.each do |k,v|
      rule.value = k
      assert_equal v, rule.safe_value
    end
  end
  
  test "it converts simple date operators to sql" do
    rule = Rule.new
    rule.rule_template = RuleTemplate.new :match_type => "date", :fields => "created_at"
    rule.operator = "<"
    rule.value = "now"
    rule.field = "created_at"
    assert_equal ["created_at < NOW()"], rule.to_conditions
  end
  
  test "it knows about string types and converts simple substring match to sql" do
    rule = Rule.new
    rule.rule_template = RuleTemplate.new :match_type => "string", :fields => "title"
    rule.operator = "like"
    rule.value = "monkeys are cool"
    rule.field = "title"
    assert_equal ["title LIKE ?", "%monkeys are cool%"], rule.to_conditions
  end
  
  test "it knows about string types and converts an OR query to a series of LIKE sql" do
    rule = Rule.new
    rule.rule_template = RuleTemplate.new :match_type => "string", :fields => "title"
    rule.operator = "any"
    rule.value = "monkeys cool"
    rule.field = "title"
    assert_equal ["title LIKE ? OR title LIKE ?", "%monkeys%", "%cool%"], rule.to_conditions
  end
end
