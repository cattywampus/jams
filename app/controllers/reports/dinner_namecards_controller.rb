class Reports::DinnerNamecardsController < ApplicationController
  def show
    @event = Event.find params[:event_id]
    @judges = @event.judges.confirmed.attending_dinner

  end

end
