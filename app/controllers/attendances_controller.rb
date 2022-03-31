# frozen_string_literal: true

# Controller for attendances
class AttendancesController < ApplicationController
  before_action :set_attendance, only: %i[show edit update destroy]

  # GET /attendances or /attendances.json
  def index
    @attendances = Attendance.all
  end

  # GET /attendances/1 or /attendances/1.json
  def show; end

  # GET /attendances/new
  def new
    @attendance = Attendance.new
  end

  # GET /attendances/1/edit
  def edit; end

  # POST /attendances or /attendances.json
  def create
    @employee = Employee.where(private_number: attendance_params[:employee_private_number]).first
    return redirect_to new_attendance_url, alert: 'Verify your private number' if @employee.nil?

    @attendance = Attendance.where(employee_id: @employee.id).where('check_in BETWEEN ? AND ?',
                                                                    DateTime.now.beginning_of_day, DateTime.now.end_of_day).last
    if @attendance
      return redirect_to new_attendance_url, alert: 'You have already check out today' if @attendance.check_out

      @attendance.update_attribute(:check_out, DateTime.now)
    else
      @attendance = Attendance.new({ employee_id: @employee.id, check_in: DateTime.now })
      @attendance.save
    end

    redirect_to new_attendance_url, notice: 'Attendance was successfully created.'
  end

  # PATCH/PUT /attendances/1 or /attendances/1.json
  def update
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.html { redirect_to attendance_url(@attendance), notice: 'Attendance was successfully updated.' }
        format.json { render :show, status: :ok, location: @attendance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1 or /attendances/1.json
  def destroy
    @attendance.destroy

    respond_to do |format|
      format.html { redirect_to attendances_url, notice: 'Attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_attendance
    @attendance = Attendance.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def attendance_params
    params.require(:attendance).permit(:employee_private_number)
  end
end
