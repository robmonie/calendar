class AddGoogleExpiresInToUsers < ActiveRecord::Migration
  def change
     change_table :users do |t|
        t.integer :google_expires_in
      end
  end
end
