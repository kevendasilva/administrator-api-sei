class AddCostPerHourToParkings < ActiveRecord::Migration[7.0]
  def change
    add_column :parkings, :cost_per_hour, :float
  end
end
