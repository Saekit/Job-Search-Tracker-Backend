class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.date :date
      t.integer :amount_completed
      t.string :url
      t.belongs_to :week, foreign_key: true

      t.timestamps
    end
  end
end
