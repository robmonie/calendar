class CreateAppointmentTypes < ActiveRecord::Migration
  def change
    create_table :appointment_types do |t|
      t.string :name
      t.integer :duration
      t.decimal :price
      t.references :user
    end
  end
end
