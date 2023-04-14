class RecordsController < ApplicationController
  def index
  end

  def show
    # debugger
    @record =Record.find(params[:id])
    if current_user.doctor
      send_data generate_pdf(@record),
      filename: "pradum.pdf",
      type: "application/pdf"
    end
  end

  def new
    @record = Record.new
  end

  def create
    p = current_user.patient
    @record = p.build_record(record_params)
    if @record.save
      redirect_to @record
    else
      render :new
    end
  end

  private
  def record_params
    params.require(:record).permit(:patient_disease, :suffering_period, :height, :weight)
  end

  def generate_pdf(record)
    Prawn::Document.new do
      # text record.name, align: :center
      text "Address: #{record.patient_disease}"
      text "Email: #{record.suffering_period}"
    end.render
  end
end
