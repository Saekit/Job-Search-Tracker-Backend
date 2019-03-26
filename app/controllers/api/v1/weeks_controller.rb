class Api::V1::WeeksController < ApplicationController
  before_action :find_week, only: [:update, :destroy]
  def index
    @weeks = Week.all
    render json: @weeks
  end

  def create
    @week = Week.create(week_params)
    render json: @week
  end

  def update
    @week.update(week_params)
    if @week.save
      render json: @week
    else
      render json: {errors: @week.errors.full_messages}
    end
  end

  def destroy
    @weeks = Week.all
    @week.destroy
    render json: @weeks
  end

  private
  def week_params
    params.require(:week).permit(:start_date, :end_date, :user_id)
  end

  def find_week
    @week = Week.find(params[:id])
  end
end
