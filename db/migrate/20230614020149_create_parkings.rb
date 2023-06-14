class CreateParkings < ActiveRecord::Migration[7.0]
  def change
    create_table :parkings do |t|
      t.string :name
      t.string :address
      t.time :opening_time
      t.time :closing_time
      t.references :administrator, null: false, foreign_key: true

      t.timestamps
    end
  end
end
