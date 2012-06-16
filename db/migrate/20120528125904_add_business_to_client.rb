class AddBusinessToClient < ActiveRecord::Migration
  def change
    change_table :clients do |t|
      t.references :business
    end
  end
end
