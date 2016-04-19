class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.string :poc_name
      t.string :poc_phone

      t.timestamps null: false
    end
  end
end
