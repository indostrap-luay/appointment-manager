class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @appointments = Appointment.all
    respond_with(@appointments)
  end

  def show
    respond_with(@appointment)
  end

  def new
    @appointment = Appointment.new
    respond_with(@appointment)
  end

  def edit
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      redirect_to appointments_path, notice: "Success save"
    else
      render "new"
    end
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to appointments_path, notice: "Succes save"
    else
      render "edit"
    end
  end

  def destroy
    @appointment.destroy
    respond_with(@appointment)
  end

  def physician
    @appointments = Appointment.where(physician_id: current_user.id)
  end

  private
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def appointment_params
      params.require(:appointment).permit(:date_apointement, :is_cancel, :reason_cancel, :patient_name, :patient_code, :birthdate, :gender, :physician_id)
    end
end
