class AssignUserToBusiness < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.references :business
    end
  end
end
