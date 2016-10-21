class Reports::EvaluationsController < ApplicationController
  def show
    @event = Event.find params[:event_id] if params[:event_id]
  end
end
