# frozen_string_literal: true

module ReportsHelper
    def today_to_check(data)
        data ? "✅": "❌"
    end
end