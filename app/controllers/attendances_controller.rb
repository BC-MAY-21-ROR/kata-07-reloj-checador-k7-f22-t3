class AttendancesController < ApplicationController
  before_action :set_attendance, only: %i[ show edit update destroy ]

  # GET /attendances or /attendances.json
  def index
    @attendances = Attendance.all
  end

  # GET /attendances/1 or /attendances/1.json
  def show
  end

  # GET /attendances/new
  def new
    @attendance = Attendance.new
  end

  # GET /attendances/1/edit
  def edit
  end

  # POST /attendances or /attendances.json
  def create
    respond_to do |format|
      employee = Employee.find_by(private_number: attendance_params[:employee_private_number])
      if employee == nil
        puts "El empleado no existe"
        # flash.notice = "pinga"
        return
        # return format.html { redirect_to attendance_url(registro), notice: "No existes xd" }
      end

      registro = Attendance.find_by(employee_private_number: attendance_params[:employee_private_number])
      puts "---------------------------------------------------------"
      if registro != nil
        puts "si hay"
        if registro["check_out"]
          format.html { redirect_to attendance_url(registro), notice: "Ya te registraste por hoy" }
        else
          registro.update({"check_out": DateTime.now()})
          format.html { redirect_to attendance_url(registro), notice: "Se registró tu Salida" }
        end
      else
        puts "no hay"
        nuevo = {"check_in" => DateTime.now()}.merge(attendance_params)
        @attendance = Attendance.new(nuevo)

        if @attendance.save
          format.html { redirect_to attendance_url(@attendance), notice: "Se registró tu Entrada" }
        else
          format.html { render :new, status: :unprocessable_entity }
        end

      end
    end
  end

  # PATCH/PUT /attendances/1 or /attendances/1.json
  def update
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.html { redirect_to attendance_url(@attendance), notice: "Attendance was successfully updated." }
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
      format.html { redirect_to attendances_url, notice: "Attendance was successfully destroyed." }
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
      params.require(:attendance).permit(:employee_private_number, :check_in, :check_out)
    end
end
