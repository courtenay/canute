class RuleSet < ActiveRecord::Base
  has_many :rules, :order => "position ASC"

  def conditions
    c = [[]]
    rules.each do |rule|
      rule_condition = rule.to_conditions
      c[0] << "(#{rule_condition[0]})"
      c << rule_condition[1..-1]
    end
    [c[0].join(" AND "), c[1..-1]].flatten
  end
end
