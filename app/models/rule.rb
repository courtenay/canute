class Rule < ActiveRecord::Base
  belongs_to :rule_template
  belongs_to :rule_set
  acts_as_list :scope => :rule_set_id
  
  validates_presence_of :rule_template_id
  validates_presence_of :field
  validates_presence_of :operator
  validates_presence_of :value

  validates_each(:field) do |record,attrib,value|
    if record.rule_template.nil?
      record.errors.add :rule_template 
    else
      record.errors.add attrib, "Not in the list" unless record.rule_template.fields.include?(value)
    end
  end
  
  def name
    "#{field} #{operator} #{value}"
  end
  
  def self.operators
    { "date" => 
      {"Less than / before" => "<",
       "Greater than / after" => ">", 
       "Equal to" => "=",
       "Not equal to" => "<>" 
      },
      "string" =>
      { "exact match" => "like",
        "any words"   => "any"
      },
      "association" =>
      { "assigned to ID" => "id",
        "not assigned to anyone (leave blank)" => "null"
      }
    }
  end
  
  def safe_value
    case value
    when /^(\d+) (day|week|month|year)s? ago$/
      "(NOW() - INTERVAL #{$1} #{$2})"
    when /^now\(\)$/, /^now|today$/
      "NOW()"
    # 2004-02-04
    when /^(\d{4}\-\d{1,2}\-\d{1,2})/
      "DATE('#{$1}')"
    # 12-24-2004
    when /^(\d{1,2})[-\/](\d{1,2})[-\/](\d{4})/
      "DATE('#{$3}-#{$1}-#{$2}')"
    else
      raise "Unknown value '#{value}'"
    end
  end

  def to_conditions
    raise "No rule template"                                           unless rule_template
    raise "Bad field - #{field} for #{rule_template.name}"             unless rule_template.fields.include?(field)
    raise "Bad operator - #{operator} for #{rule_template.match_type}" unless Rule.operators[rule_template.match_type].values.include?(operator)

    case rule_template.match_type
    when 'string'
      processor = { 'like' => Operators::Like, 'any' => Operators::Any }[operator]
      processor.new(field, value).to_sql
    when 'association'
      processor = { 'null' => Operators::Null, 'id' => Operators::Primary }[operator]
      processor.new(field, value).to_sql
    when 'date'
      ["#{field} #{operator} #{safe_value}"]
    end  
  end
  
  def display_conditions
    str = to_conditions
    str.is_a?(Array) ? str.inspect : str
  end
end
