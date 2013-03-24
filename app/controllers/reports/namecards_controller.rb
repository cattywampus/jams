class Reports::NamecardsController < ApplicationController
  def show
    @event = Event.find params[:event_id]
    @judges = @event.judges.confirmed
  end

end
