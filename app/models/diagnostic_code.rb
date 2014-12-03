class DiagnosticCode < ActiveRecord::Base
	has_many   :appointment_diagnostic_codes
	has_many   :appointments, through: :appointment_diagnostic_codes
end
