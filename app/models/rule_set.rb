class RuleSet < ActiveRecord::Base
  has_many :rule_items
  has_many :rules, :through => :rule_items
  
  
  #def rule_ids=(val)
  #  raise
  #end
  
  def rule
  end
end
