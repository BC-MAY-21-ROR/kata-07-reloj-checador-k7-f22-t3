class ReportsController < ApplicationController
  def show
    @employees = Employee.all
    @today_attendances = Attendance.where(check_in: Date.today.all_day)
    @month_attendances = Attendance.where('check_in BETWEEN ? AND ?', DateTime.now.beginning_of_month, DateTime.now.end_of_month)

    @changed_employees = @employees.collect do |employee|
      new_employee = {name: employee.name}
      new_employee[:today_assist] = @today_attendances.find { |att| att.employee_id == employee.id } ? true : false

      seconds = (@month_attendances.filter{|att| att.employee_id == employee.id}.collect{|att| att.check_out - att.check_in}.sum / DateTime.now.day).to_i
      
      hours = (seconds/3600).to_i
      seconds_left = seconds%3600
      minutes = (seconds_left/60).to_i
      seconds_left = seconds_left%60
      new_employee[:average] = "#{hours}:#{minutes}:#{seconds_left}"
      new_employee
    end
  end
end
