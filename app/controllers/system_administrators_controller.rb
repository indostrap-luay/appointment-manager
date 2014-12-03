class SystemAdministratorsController < ApplicationController
	before_action :authenticate_user!

  def index
  end

  def appointments_report
    @appointments = Appointment.select("id, patient_name, patient_code, date_apointement, physician_id, is_cancel, created_at").order("created_at DESC")
  end
end
