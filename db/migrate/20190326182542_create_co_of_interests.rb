class CreateCoOfInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :co_of_interests do |t|
      t.string :company_name
      t.string :target_contact
      t.string :my_contact
      t.belongs_to :week, foreign_key: true

      t.timestamps
    end
  end
end
