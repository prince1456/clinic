class AddingArabicFieldsToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :first_name_arabic, :string
    add_column :profiles, :last_name_arabic, :string
    add_column :profiles, :position_arabic, :string
    add_column :profiles, :bio_arabic, :text
  end
end
