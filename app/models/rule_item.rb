class RuleItem < ActiveRecord::Base
  belongs_to :rule
  belongs_to :rule_set
  acts_as_list :scope => :rule_set
end
