class AddWarrantyDateToComputers < ActiveRecord::Migration
  def change
    add_column :computers, :warranty_date, :date
  end
end
