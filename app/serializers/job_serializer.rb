class JobSerializer < ActiveModel::Serializer
  attributes :id, :company, :contact_name_title, :date, :action, :method_contacted, :first_time_contacting_co, :source_referral, :job_title, :link_to_job_an, :notes, :next_step, :action_complete, :status
  belongs_to :week
end
