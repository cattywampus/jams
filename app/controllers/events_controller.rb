class EventsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    @judges = @event.judges.joins(:person).order("first_name ASC, last_name ASC")

    @counts = {}
    @counts[:missing_vims] = @judges.confirmed.where({completed_vims: [false, nil]}).count
    @counts[:missing_rsvp] = @event.dinner.missing_rsvp.count if @event.dinner.present?
    @counts[:missing_bio] = @judges.confirmed.where({biography: [nil, ""]}).count
    @counts[:missing_conflict] = @judges.confirmed.where({provided_conflict: [false, nil]}).count
    @counts[:missing_consent] = @judges.confirmed.where({provided_consent: [false, nil]}).count

    respond_to do |format|
      format.html { render layout: "event" }
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  def roster
    @event = Event.find params[:event_id]
    @judges = @event.confirmed_judges

    respond_to do |format|
      format.html
      format.json { render json: [@event, @judges] }
    end
  end

  def candidates
    @event = Event.find params[:id]
    if params[:name].present?
      @candidates = @event.possible_judges.where("lower(first_name) like ? or lower(last_name) like ?", 
                    "%#{params[:name].downcase}%", "%#{params[:name].downcase}%")
    else
      @candidates = @event.possible_judges
    end

    respond_to do |format|
      format.json { render json: @candidates.map { |c| {id: c.id, text: c.full_name} } }
    end
  end
end
