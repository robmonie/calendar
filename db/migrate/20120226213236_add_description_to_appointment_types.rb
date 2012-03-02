class AddDescriptionToAppointmentTypes < ActiveRecord::Migration
  def change
    change_table :appointment_types do |t|
      t.string :description
    end
  end
end
