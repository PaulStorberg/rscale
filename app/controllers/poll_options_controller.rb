class PollOptionsController < ApplicationController
  helper PollOptionHelper

  before_action :set_poll_option

  def index
    @poll_options = PollOption.all
  end

  def show
  end

  def new
    @poll = Poll.find(params[:poll_id])
  end

  def create
    @poll_option.assign_attributes(poll_option_params)
    if @poll_option.save
      flash[:notice] = "Poll option has been created!"
      redirect_to poll_option_path(@poll_option)
    else
      flash[:alert] = "Poll option not created."
      render "new"
    end
  end

  def edit
    @poll = Poll.find(@poll_option.poll_id)
  end

  def update
    if @poll_option.update(poll_option_params)
      flash[:notice] = "You have updated the Poll Option!"
      redirect_to poll_option_path(@poll_option)
    else
      flash[:alert] = "Poll option unable to update."
    end
  end

  def destroy
    @poll_option.destroy
    flash[:notice] = "Poll Option removed"
    redirect_back(fallback_location: root_path)
  end

  private

  def set_poll_option
    @poll_option = params[:id].present? ? PollOption.find(params[:id]) : PollOption.new
  end

  def poll_option_params
    params.require(:poll_option).permit(
      :description,
      :poll_id,
      :title,
      :user_id
    )
  end
end