class AppointmentsController < ApplicationController
  # before_action: doct
  def index
    @patient = current_user.patient.appointments
    
    
  end

  def show
 
  end

  def new
  end

  def create
    # debugger
    current= current_user.patient
    # puts "#{$doc.id}"k
    @appointment = current.appointments.create(appointment_params)

    if @appointment.update(doctor_id:$doc.id)
      redirect_to appointments_path
    end
  end

  def edit
    $doc = Doctor.find(params[:id])
    @appointment = Appointment.new
  end

  def update
    current= current_user.patient
    @appointment = current.appointments.create(appointment_params,doctor_id:@doc.id)
    if @appointment.save
      redirect_to appointments_path
    end
  end

  private 
  def appointment_params
    params.require(:appointment).permit(:start_time, :end_time,:doctor_id)
  end
  # def doct
  #   @doct = Doctor.find(params[:id])
  # end
end
