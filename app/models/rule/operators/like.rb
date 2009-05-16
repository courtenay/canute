class Rule
  module Operators
    class Like < Base
      def to_sql
        ["#{field} LIKE ?", "%#{value}%"]
      end
    end
  end
end