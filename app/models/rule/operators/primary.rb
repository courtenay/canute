class Rule
  module Operators
    class Primary < Base
      def to_sql
        ["#{field}_id = ?", value]
      end
    end
  end
end