class Reports::BiographiesController < ApplicationController
  layout "event"
  before_filter :authenticate_user!
  before_filter :load_event

  def index
    @judges = @event.confirmed_judges
  end

  def approved
    @judge = Judge.find params[:biography_id]
    @judge.biography_approved = true

    respond_to do |format|
      if @judge.save
        format.html { redirect_to :back, notice: "Biography approved for #{@judge.full_name}" }
      else
        format.html { redirect_to :back, alert: "Unable to approve biography for #{@judge.full_name}" }
      end
    end
  end

  def edit
    @judge = Judge.find params[:id]

    authorize! :edit, @judge
  end

  def update
    @judge = Judge.find params[:id]

    authorize! :update, @judge

    respond_to do |format|
      if @judge.update_attributes params[:judge]
        format.html { redirect_to event_biographies_path(@event), notice: "Update biography for #{@judge.full_name}" }
      else
        format.html { render "edit", alert: "Unable to update biography" }
      end
    end
  end

private

  def load_event
    @event = Event.find params[:event_id]
    authorize! :read, @event
  end
end
