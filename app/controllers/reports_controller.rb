class ReportsController < ApplicationController
  def index
    @employees = Employee.actives
  end
end
