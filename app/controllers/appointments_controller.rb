class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: [:show, :edit, :update, :destroy, :insert_diagnostic, :update_diagnostic, :new_invoice, :update_invoice, :show_invoice]

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
    @appointments = Appointment.where("physician_id = ? AND is_cancel = false", current_user.id)
  end

  def insert_diagnostic
  end

  def update_diagnostic
    if @appointment.update_attributes(appointment_params)
      @appointment.update(is_have_diagnostic: true)
      redirect_to physician_appointments_path, notice: "Success Save"
    else
      render insert_diagnostic
    end
  end

  def invoice
    @appointments = Appointment.where(is_have_diagnostic: true)
  end

  def new_invoice
  end

  def show_invoice
  end

  def update_invoice
    if @appointment.update_attributes(appointment_params)
      @appointment.update_attributes(is_invoice: true, date_invoice: Time.now)
      redirect_to invoice_appointments_path, notice: "Success Save"
    else
      render "new_invoice"
    end
  end

  private
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def appointment_params
      params.require(:appointment).permit(:number_invoice, :date_apointement, :is_cancel, :reason_cancel, :patient_name, :patient_code, :birthdate, :gender, :physician_id, appointment_diagnostic_codes_attributes: [:id, :appointment_id, :diagnostic_code_id, :notes, :_destroy])
    end
end
