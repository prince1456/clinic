class AddProfileToDirectory < ActiveRecord::Migration[5.0]
  def change
    add_reference :directories, :profile, index: true, foreign_key: true
  end
end
