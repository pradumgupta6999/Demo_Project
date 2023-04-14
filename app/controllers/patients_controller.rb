class PatientsController < ApplicationController
  def index
    @doctor = Doctor.all
    @patient = current_user
  end

  def appointment
      @patient = Patient.find(params[:id])
      
  end

  def show
    # debugger
    doctor = Doctor.find(params[:id])
    patient = current_user.patient
    patient.doctors << doctor
    @doctors = patient.doctors 
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = current_user.build_patient(patient_params)
    
    if @patient.save
      redirect_to patients_appoinment_path(@patient)
    else
      render :new
    end
  end

  def appointment 
  end 
  private
  def patient_params
    params.require(:patient).permit(:patient_name, :mobile, :address)
  end
end
