class CreateDiagnoticCodes < ActiveRecord::Migration
  def change
    create_table :diagnostic_codes do |t|
      t.text   :description
      t.string :code
      t.float  :price

      t.timestamps
    end
  end
end
