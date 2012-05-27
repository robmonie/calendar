class ModifyAvailabilityTimeColumns < ActiveRecord::Migration

  def change
    remove_column :availabilities, :start_time
    remove_column :availabilities, :end_time

    change_table :availabilities do |t|
      t.integer :start_hour
      t.integer :start_minute
      t.integer :end_hour
      t.integer :end_minute
    end
  end

end
