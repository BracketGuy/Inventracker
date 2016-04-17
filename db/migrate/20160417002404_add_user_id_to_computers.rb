class AddUserIdToComputers < ActiveRecord::Migration
  def change
    add_column :computers, :user_id, :integer
  end
end
