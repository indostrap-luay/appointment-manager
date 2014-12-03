class AddIsInvoiceToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :number_invoice, :string
    add_column :appointments, :is_invoice, :boolean, default: false
    add_column :appointments, :is_have_diagnostic, :boolean, default: false
    add_column :appointments, :date_invoice, :date
  end
end