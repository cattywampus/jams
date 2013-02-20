class DinnerEventsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /dinner_events
  # GET /dinner_events.json
  def index
    @dinner_events = DinnerEvent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dinner_events }
    end
  end

  # GET /dinner_events/1
  # GET /dinner_events/1.json
  def show
    @dinner_event = DinnerEvent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dinner_event }
    end
  end

  # GET /dinner_events/new
  # GET /dinner_events/new.json
  def new
    @dinner_event = DinnerEvent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dinner_event }
    end
  end

  # GET /dinner_events/1/edit
  def edit
    @dinner_event = DinnerEvent.find(params[:id])
  end

  # POST /dinner_events
  # POST /dinner_events.json
  def create
    @dinner_event = DinnerEvent.new(params[:dinner_event])

    respond_to do |format|
      if @dinner_event.save
        format.html { redirect_to @dinner_event, notice: 'Dinner event was successfully created.' }
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
    @dinner_event = DinnerEvent.find(params[:id])

    respond_to do |format|
      if @dinner_event.update_attributes(params[:dinner_event])
        format.html { redirect_to @dinner_event, notice: 'Dinner event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dinner_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dinner_events/1
  # DELETE /dinner_events/1.json
  def destroy
    @dinner_event = DinnerEvent.find(params[:id])
    @dinner_event.destroy

    respond_to do |format|
      format.html { redirect_to dinner_events_url }
      format.json { head :no_content }
    end
  end
end
