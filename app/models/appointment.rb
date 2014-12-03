class Appointment < ActiveRecord::Base
	validates :patient_name, :patient_code, presence: true

	has_many   :appointment_diagnostic_codes
	has_many   :diagnostic_codes, through: :appointment_diagnostic_codes
	belongs_to :physician, class_name: "User", foreign_key: "physician_id"

	accepts_nested_attributes_for :appointment_diagnostic_codes, :reject_if => :all_blank, :allow_destroy => true

	def total_price
		self.diagnostic_codes.pluck(:price).sum
	end
end