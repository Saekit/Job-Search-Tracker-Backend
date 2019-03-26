class Api::V1::CoOfInterestsController < ApplicationController
  before_action :find_co_of_interest, only: [:update, :destroy]
  def index
    @co_of_interests = CoOfInterest.all
    render json: @co_of_interests
  end

  def create
    @co_of_interest = CoOfInterest.create(co_of_interest_params)
    render json: @co_of_interest
  end

  def update
    @co_of_interest.update(co_of_interest_params)
    if @co_of_interest.save
      render json: @co_of_interest
    else
      render json: {errors: @co_of_interest.errors.full_messages}
    end
  end

  def destroy
    @co_of_interests = CoOfInterest.all
    @co_of_interest.destroy
    render json: @co_of_interests
  end

  private
  def co_of_interest_params
    params.require(:co_of_interest).permit(:company_name, :target_contact, :my_contact, :week_id)
  end

  def find_co_of_interest
    @co_of_interest = CoOfInterest.find(params[:id])
  end
end
