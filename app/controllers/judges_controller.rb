class JudgesController < ApplicationController
  before_action :authenticate_user!
  layout "event"

  # GET /judges
  # GET /judges.json
  def index
    if params[:event_id]
      @event = Event.find params[:event_id]
      @judges = @event.judges.joins(:person)
    else
      @judges = Judge.joins(:person)
    end

    if params[:status].present?
      @judges = @judges.where({status: params[:status]})
    end

    @judges = @judges.order("first_name ASC, last_name ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @judges }
      format.csv { render text: @judges.to_csv }
      format.xls
    end
  end

  # GET /judges/1
  # GET /judges/1.json
  def show
    @judge = Judge.find(params[:id])
    @event = @judge.event

    respond_to do |format|
      format.html { render layout: "event" }
      format.json { render json: @judge }
    end
  end

  # GET /judges/new
  # GET /judges/new.json
  def new
    @judge = Judge.new
    @person = Person.new

    if params[:event_id]
      @event = Event.find params[:event_id]
      @judge.event = @event
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @judge }
    end
  end

  # GET /judges/1/edit
  def edit
    @judge = Judge.find(params[:id])
    @event = @judge.event
  end

  # POST /judges
  # POST /judges.json
  def create
    @judge = Judge.new(judge_params)

    respond_to do |format|
      if @judge.save
        format.html { redirect_to @judge, notice: 'Judge was successfully created.' }
        format.json { render json: @judge, status: :created, location: @judge }
      else
        format.html { render action: "new" }
        format.json { render json: @judge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /judges/1
  # PUT /judges/1.json
  def update
    @judge = Judge.find(params[:id])
    @event = @judge.event

    respond_to do |format|
      if @judge.update_attributes(judge_params)
        format.html { redirect_to [@event, @judge], notice: 'Judge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @judge.errors, status: :unprocessable_entity }
      end
    end
  end

  def import
    @event = Event.find params[:event_id]
    FIRST::JudgeImporter.import_vms_report(params[:file], @event)
    redirect_to event_judges_path(@event)
  end

  # DELETE /judges/1
  # DELETE /judges/1.json
  def destroy
    @judge = Judge.find(params[:id])
    @judge.destroy

    respond_to do |format|
      format.html { redirect_to event_judges_path(@judge.event) }
      format.json { head :no_content }
    end
  end

  private

  def judge_params
    params.require(:judge)
          .permit(:attending_dinner,
                  :biography,
                  :completed_vims,
                  :event_id,
                  :needs_shirt,
                  :person_id,
                  :provided_conflict,
                  :provided_consent,
                  :received_event_info,
                  :role,
                  :rookie,
                  :status)
  end
end
