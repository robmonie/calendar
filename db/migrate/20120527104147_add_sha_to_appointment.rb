class AddShaToAppointment < ActiveRecord::Migration
  def change
    add_column  :appointments, :sha, :string
    add_index   :appointments, :sha
  end
end
