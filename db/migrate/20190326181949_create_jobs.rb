class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :company
      t.string :contact_name_title
      t.date :date
      t.string :action
      t.string :method_contacted
      t.boolean :first_time_contacting_co
      t.string :source_referral
      t.string :job_title
      t.string :link_to_job_an
      t.string :notes
      t.string :next_step
      t.boolean :action_complete
      t.string :status
      t.belongs_to :week, foreign_key: true

      t.timestamps
    end
  end
end
