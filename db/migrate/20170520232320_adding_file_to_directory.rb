class AddingFileToDirectory < ActiveRecord::Migration[5.0]
  def change
    add_column :directories, :file, :string
  end
end
