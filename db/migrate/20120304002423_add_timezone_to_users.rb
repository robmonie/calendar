class AddTimezoneToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :timezone
    end
  end
end
