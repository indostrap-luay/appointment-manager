class CreateAppointmentDiagnosticCodes < ActiveRecord::Migration
  def change
    create_table :appointment_diagnostic_codes do |t|
      t.integer :appointment_id
      t.integer :diagnostic_code_id
      t.text :notes

      t.timestamps
    end
    add_index :appointment_diagnostic_codes, :appointment_id
    add_index :appointment_diagnostic_codes, :diagnostic_code_id
  end
end
