class HospitalsController < ApplicationController
  def index
    @doctor = Doctor.all
  end

  def show
    @hospital = Hospital.find(params[:id])
  end

  def new
    @hospital = Hospital.new
  end

  def create
    @hospital = current_user.build_hospital(hospital_params)
    if @hospital.save
      # cookies[:info]=@hospital.id
      # <%a=cookies[:info]%>
      # <%=a%>
      # <%=a.id%>

      redirect_to @hospital
    else
      render :new
    end
  end

  def edit
    @hospital = current_user.hospital
    @doctor = Doctor.find(params[:id]) 
    @hospitalhavedoctors = @hospital.doctors
    # if @hospitalhavedoctors == []
    #   @hospital.doctors << @doctor
    # end  
  end

  private
  def hospital_params
    params.require(:hospital).permit(:hospital_name, :mobile, :address, :city)
  end
end
