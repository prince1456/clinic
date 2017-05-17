class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.integer :phone_number
      t.string :emr_name
      t.integer :emr_phone
      t.string :gender
      t.integer :age
      t.string :nationality
      t.string :married
      t.string :job
      t.string :image

      t.timestamps
    end
  end
end
