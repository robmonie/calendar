class AddCalendarIdToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :calendar_id
    end
  end
end
