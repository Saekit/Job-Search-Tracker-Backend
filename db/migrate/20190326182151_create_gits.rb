class CreateGits < ActiveRecord::Migration[5.2]
  def change
    create_table :gits do |t|
      t.date :date
      t.integer :amount_completed
      t.belongs_to :week, foreign_key: true

      t.timestamps
    end
  end
end
