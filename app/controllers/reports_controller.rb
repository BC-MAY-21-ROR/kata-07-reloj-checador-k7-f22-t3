class ReportsController < ApplicationController
  def show
    @employees = Employee.all
    @today_attendances = Attendance.where(check_in: Date.today.all_day)
    @changed_employees = @employees.collect do |employee|
      new_employee = {name: employee.name}
      new_employee[:today_assist] = @today_attendances.find { |att| att.employee_id == employee.id } ? true : false
      new_employee
    end
  end
end
