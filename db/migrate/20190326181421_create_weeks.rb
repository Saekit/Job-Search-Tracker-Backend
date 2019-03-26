class CreateWeeks < ActiveRecord::Migration[5.2]
  def change
    create_table :weeks do |t|
      t.belongs_to :user, foreign_key: true
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
