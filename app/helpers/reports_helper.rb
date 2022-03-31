# frozen_string_literal: true

# Helper to reports
module ReportsHelper
  def today_to_check(data)
    data ? '✅' : '❌'
  end
end
