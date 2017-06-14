class AddLanguageToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :lang, :string
  end
end
