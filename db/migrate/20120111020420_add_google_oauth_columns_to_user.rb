class AddGoogleOauthColumnsToUser < ActiveRecord::Migration
  def change

    change_table :users do |t|
      t.string :google_access_token
      t.string :google_refresh_token
      t.datetime :google_issued_at
    end

    remove_column :users, :google_password

  end
end
