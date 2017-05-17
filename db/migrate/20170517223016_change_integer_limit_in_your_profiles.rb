class ChangeIntegerLimitInYourProfiles < ActiveRecord::Migration[5.0]
  def change
    change_column :profiles, :phone_number, :numeric, limit: 12
    change_column :profiles, :emr_phone, :numeric, limit: 12
  end
end
