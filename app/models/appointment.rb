class Appointment < ActiveRecord::Base
	validates :patient_name, :patient_code, presence: true

	belongs_to :physician, class_name: "User", foreign_key: "physician_id"
end
