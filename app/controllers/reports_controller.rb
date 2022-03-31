# frozen_string_literal: true

# Report controller
class ReportsController < ApplicationController
  def index
    @employees = Employee.actives
  end
end
