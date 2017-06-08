class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.string :notifiable_type, polymorphic: true, index: true
      t.integer :notifiable_id

      t.timestamps
    end
  end
end
