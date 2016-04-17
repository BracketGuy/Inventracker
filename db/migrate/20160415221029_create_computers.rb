class CreateComputers < ActiveRecord::Migration
  def change
    create_table :computers do |t|
      t.string :name
      t.string :os
      t.text :notes
      t.date :deployment_date
      t.date :verification_date

      t.timestamps null: false
    end
  end
end
