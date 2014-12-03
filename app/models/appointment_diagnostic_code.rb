class AppointmentDiagnosticCode < ActiveRecord::Base
	belongs_to :diagnostic_code
	belongs_to :appointment
end