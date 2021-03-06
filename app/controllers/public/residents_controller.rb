class Public::ResidentsController < ApplicationController
  before_action :authenticate_resident!
  before_action :today

  def show
    @myevents = current_resident.myevents
    @today_events = @myevents.for_today.order(:start)
    @recent_post = Post.last
  end

  def confirm
  end

  def edit
  end

  def update
    if current_resident.update(resident_params)
      redirect_to mypage_url
    end
  end

  private

  def resident_params
    params.require(:resident).permit(:photo_accepted, :self_message)
  end
end
