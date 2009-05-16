class RuleTemplate < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :fields
  has_many :rules

  serialize :fields, Array
  
  def fields=(val)
    write_attribute :fields, val.split(/, /).map { |v| v.strip; v unless v.blank? }.compact
  end
  
end