class Rule
  module Operators
    class Primary < Base
      def to_sql
        ["#{field} = ?", value]
      end
    end
  end
end