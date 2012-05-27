class CreateAppointments < ActiveRecord::Migration

  def change
    create_table :appointments do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :comments
      t.references :client
      t.references :user
      t.references :appointment_type

      t.timestamps
    end
  end
end
