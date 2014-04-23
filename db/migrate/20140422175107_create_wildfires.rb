class CreateWildfires < ActiveRecord::Migration
  def change
    create_table :wildfires do |t|
      t.date :start_date
      t.date :end_date
      t.string :description
      t.integer :area_burned
      t.integer :fatalities

      t.timestamps
    end
  end
end
