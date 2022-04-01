# frozen_string_literal: true

# Controller for attendances
class AttendancesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]

  # GET /attendances or /attendances.json
  def index
    if user_signed_in?
      @attendances = Attendance.all
    else
      redirect_to root_url
    end
  end

  # GET /attendances/new
  def new
    @attendance = Attendance.new
  end

  # POST /attendances or /attendances.json
  def create
    @employee = Employee.where(private_number: attendance_params[:employee_private_number]).first
    return redirect_to new_attendance_url, alert: t('.bad_private_number') if @employee.nil?

    @attendance = Attendance.where(employee_id: @employee.id).where('check_in BETWEEN ? AND ?',
                                                                    DateTime.now.beginning_of_day, DateTime.now.end_of_day).last
    if @attendance
      return redirect_to new_attendance_url, alert: t('.already_checked') if @attendance.check_out

      @attendance.update_attribute(:check_out, DateTime.now)
    else
      @attendance = Attendance.new({ employee_id: @employee.id, check_in: DateTime.now })
      @attendance.save
    end

    redirect_to new_attendance_url, notice: t('.success')
  end

  private
  # Only allow a list of trusted parameters through.
  def attendance_params
    params.require(:attendance).permit(:employee_private_number)
  end
end
