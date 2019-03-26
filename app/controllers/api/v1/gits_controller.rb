class Api::V1::GitsController < ApplicationController
  before_action :find_git, only: [:update, :destroy]
  def index
    @gits = Git.all
    render json: @gits
  end

  def create
    @git = Git.create(git_params)
    render json: @git
  end

  def update
    @git.update(git_params)
    if @git.save
      render json: @git
    else
      render json: {errors: @git.errors.full_messages}
    end
  end

  def destroy
    @gits = Git.all
    @git.destroy
    render json: @gits
  end

  private
  def git_params
    params.require(:git).permit(:date, :amount_completed, :week_id)
  end

  def find_git
    @git = Git.find(params[:id])
  end
end
