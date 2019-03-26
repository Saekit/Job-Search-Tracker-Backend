class CreateOneToOnes < ActiveRecord::Migration[5.2]
  def change
    create_table :one_to_ones do |t|
      t.date :date
      t.string :notes
      t.belongs_to :week, foreign_key: true

      t.timestamps
    end
  end
end
