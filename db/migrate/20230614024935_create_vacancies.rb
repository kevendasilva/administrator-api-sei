class CreateVacancies < ActiveRecord::Migration[7.0]
  def change
    create_table :vacancies do |t|
      t.string :code
      t.integer :kind
      t.references :parking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
