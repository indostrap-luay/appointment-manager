class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string   :patient_name
      t.string   :patient_code
      t.date     :birthdate
      t.string   :gender
      t.integer  :physician_id
      t.datetime :date_apointement
      t.boolean  :is_cancel
      t.text     :reason_cancel

      t.timestamps
    end

    add_index :appointments, :physician_id
  end
end
