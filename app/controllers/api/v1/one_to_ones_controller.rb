class Api::V1::OneToOnesController < ApplicationController
  before_action :find_one_to_one, only: [:update, :destroy]
  def index
    @one_to_ones = OneToOne.all
    render json: @one_to_ones
  end

  def create
    @one_to_one = OneToOne.create(one_to_one_params)
    render json: @one_to_one
  end

  def update
    @one_to_one.update(one_to_one_params)
    if @one_to_one.save
      render json: @one_to_one
    else
      render json: {errors: @one_to_one.errors.full_messages}
    end
  end

  def destroy
    @one_to_ones = OneToOne.all
    @one_to_one.destroy
    render json: @one_to_ones
  end

  private
  def one_to_one_params
    params.require(:one_to_one).permit(:date, :notes, :week_id)
  end

  def find_one_to_one
    @one_to_one = OneToOne.find(params[:id])
  end
end
