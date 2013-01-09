class CreateBusyTimes < ActiveRecord::Migration
  def change
    create_table :busy_times do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :user

      t.timestamps

    end
  end
end
