class AttendeesController < ApplicationController
  def new
    @attendee = Attendee.new
    @event = Event.find params[:event_id] if params[:event_id].present?
    @dinner = @event.dinner

    respond_to do |format|
      format.js
    end
  end

  def create
    @event = Event.find params[:event_id]
    @dinner = @event.dinner
    @attendee = Attendee.new params[:attendee]
    @attendee.dinner_event = @event.dinner
    @attendee.save

    respond_to do |format|
      format.js
    end
  end

  def edit
    @event = Event.find params[:event_id]
    @dinner = @event.dinner
    @attendee = Attendee.find params[:id]

    respond_to do |format|
      format.js
    end
  end

  def update
    @event = Event.find params[:event_id]
    @dinner = @event.dinner
    @attendee = Attendee.find params[:id]

    @attendee.update_attributes params[:attendee]

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @event = Event.find params[:event_id]
    @dinner = @event.dinner
    @attendee = Attendee.find params[:id]
    @attendee.destroy

    respond_to do |format|
      format.js
    end
  end
end
