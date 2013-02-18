class Reports::ShirtsController < ApplicationController
  layout "event"

  def show
    @event = Event.find params[:event_id]

    authorize! :read, @event

    respond_to do |format|
      format.html
      format.json { render json: { event: @event, shirts_need: @shirts_needed } }
    end
  end
end
