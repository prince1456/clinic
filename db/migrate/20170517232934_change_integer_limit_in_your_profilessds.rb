class ChangeIntegerLimitInYourProfilessds < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :type, :role
  end
end
