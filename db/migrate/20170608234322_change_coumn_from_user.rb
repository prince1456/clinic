class ChangeCoumnFromUser < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :role, :string, default: "patient"
  end
end
