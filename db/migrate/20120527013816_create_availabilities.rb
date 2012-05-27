class CreateAvailabilities < ActiveRecord::Migration

  def change
    create_table :availabilities do |t|
      t.integer :weekday_index
      t.datetime :start_time
      t.datetime :end_time
      t.references :user

      t.timestamps
    end
  end
end
