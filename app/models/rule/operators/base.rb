class Rule
  module Operators
    class Base
      attr_accessor :field, :value
      def initialize(field, value)
        @value = value
        @field = field
      end
    end
  end
end