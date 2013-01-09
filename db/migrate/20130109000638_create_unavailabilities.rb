class CreateUnavailabilities < ActiveRecord::Migration
  def change
    create_table :unavailabilities do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :user

      t.timestamps

    end
  end
end
