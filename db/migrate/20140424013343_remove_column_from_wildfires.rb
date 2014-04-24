class RemoveColumnFromWildfires < ActiveRecord::Migration
  def change
    remove_column :wildfires, :end_date, :date
  end
end
