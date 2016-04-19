class AddSiteIdToComputers < ActiveRecord::Migration
  def change
    add_column :computers, :site_id, :integer
  end
end
