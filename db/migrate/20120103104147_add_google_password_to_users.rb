class AddGooglePasswordToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :google_password
    end
  end
end
