class AddEntryAndExitToMovements < ActiveRecord::Migration[7.0]
  def change
    add_column :movements, :entry, :datetime
    add_column :movements, :exit, :datetime
  end
end
