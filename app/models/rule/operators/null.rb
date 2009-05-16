class Rule
  module Operators
    class Null < Base
      def to_sql
        ["#{field}_id IS NULL"]
      end
    end
  end
end