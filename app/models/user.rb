class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :appointments, class_name: "appointment", foreign_key: "physician_id"

	def self.number_physician
		self.where(user_code)
	end
end
