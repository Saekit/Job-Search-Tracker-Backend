class Api::V1::JobsController < ApplicationController
  before_action :find_job, only: [:update, :destroy]
  def index
    @jobs = Job.all
    render json: @jobs
  end

  def create
    @job = Job.create(job_params)
    render json: @job
  end

  def update
    @job.update(job_params)
    if @job.save
      render json: @job
    else
      render json: {errors: @job.errors.full_messages}
    end
  end

  def destroy
    @jobs = Job.all
    @job.destroy
    render json: @jobs
  end

  private
  def job_params
    params.require(:job).permit(:company, :contact_name_title, :date, :action, :method_contacted, :first_time_contacting_co, :source_referral, :job_title, :link_to_job_an, :notes, :next_step, :action_complete, :status, :week_id)
  end

  def find_job
    @job = Job.find(params[:id])
  end
end
