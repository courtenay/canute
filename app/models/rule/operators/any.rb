class Rule
  module Operators
    class Any < Base
      # value ANY "foo bar"
      # field LIKE '%foo%' OR field LIKE '%bar%'
      def to_sql
        values = value.split(" ").map { |v| "%#{v}%" }
        sql = ["#{field} LIKE ?"] * values.size
        [sql.join(" OR "), values].flatten
      end
    end
  end
end