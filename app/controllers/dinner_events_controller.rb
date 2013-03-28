class DinnerEventsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_event
  layout "event"

  # GET /dinner_events/1
  # GET /dinner_events/1.json
  def show
    @dinner_event = @event.dinner

    authorize! :show, @dinner_event

    respond_to do |format|
      if @dinner_event.nil?
        format.html { redirect_to new_event_dinner_path(@event) }
      else 
        format.html # show.html.erb
        format.json { render json: @dinner_event }
      end
    end
  end

  # GET /dinner_events/new
  # GET /dinner_events/new.json
  def new
    @dinner_event = DinnerEvent.new
    @dinner_event.event = @event
    
    authorize! :create, @dinner_event

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dinner_event }
    end
  end

  # GET /dinner_events/1/edit
  def edit
    @dinner_event = @event.dinner

    authorize! :edit, @dinner_event
  end

  # POST /dinner_events
  # POST /dinner_events.json
  def create
    @dinner_event = DinnerEvent.new params[:dinner_event]
    @dinner_event.event = @event

    authorize! :create, @dinner_event

    respond_to do |format|
      if @dinner_event.save
        format.html { redirect_to event_dinner_path(@event), notice: 'Dinner event was successfully created.' }
        format.json { render json: @dinner_event, status: :created, location: @dinner_event }
      else
        format.html { render action: "new" }
        format.json { render json: @dinner_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dinner_events/1
  # PUT /dinner_events/1.json
  def update
    @dinner_event = @event.dinner

    authorize! :update, @dinner_event

    respond_to do |format|
      if @dinner_event.update_attributes(params[:dinner_event])
        format.html { redirect_to event_dinner_path(@event), notice: 'Dinner event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dinner_event.errors, status: :unprocessable_entity }
      end
    end
  end

  def rsvp
    @dinner_event = @event.dinner

    authorize! :update, @dinner_event

    @attendee = Attendee.new params[:attendee]

    respond_to do |format|
      if @attendee.save
        format.html { redirect_to :back, notice: "Saved dinner reservation" }
      else
        format.html { redirect_to :back, alert: "Unable to save dinner reservation" }
      end
    end
  end

  # DELETE /dinner_events/1
  # DELETE /dinner_events/1.json
  def destroy
    @dinner_event = @event.dinner

    authorize! :destroy, @dinner_event

    @dinner_event.destroy

    respond_to do |format|
      format.html { redirect_to event_dinner_path(@event) }
      format.json { head :no_content }
    end
  end

private

  def load_event
    @event = Event.find params[:event_id]
    authorize! :read, @event
  end
end
