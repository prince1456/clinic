class AddColumnToNotifications < ActiveRecord::Migration[5.0]
  def change
    add_column :notifications, :recipent_id, :integer
    add_column :notifications, :actor_id, :integer
    add_column :notifications, :read_at, :datetime
    add_column :notifications, :action, :string
  end
end
