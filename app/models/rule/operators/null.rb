class Rule
  module Operators
    class Null < Base
      def to_sql
        ["#{field} IS NULL"]
      end
    end
  end
end