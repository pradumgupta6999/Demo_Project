class DoctorsController < ApplicationController
  def index
    doctor = current_user.doctor
    @appointment = doctor.appointments
    @record =Record.all
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = current_user.build_doctor(doctor_params)
    if @doctor.save
      redirect_to @doctor
    else
      render :new
    end
  end

  private 
    def doctor_params
      params.require(:doctor).permit(:doctor_name, :mobile, :address, :specilization, :start_time, :end_time, :appointment_date)
    end
end
