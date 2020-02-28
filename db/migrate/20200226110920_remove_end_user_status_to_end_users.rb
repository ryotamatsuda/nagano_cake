class RemoveEndUserStatusToEndUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :end_users, :end_user_status, :boolean
  end
end
