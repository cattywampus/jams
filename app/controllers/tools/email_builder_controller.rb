class Tools::EmailBuilderController < ApplicationController
  layout "event"

  def show
    @event = Event.find params[:event_id]

    @people = @event.judges

    @people = @people.where(status: status, role: role, completed_vims: vims)
    @people = filter_by_dinner(@people) if @event.dinner
  end

private

  def filter_by_dinner(people)
    case params[:attending_dinner]
    when 'rsvp'
      @people.missing_dinner_rsvp(@event.dinner)
    when 'true'
      @people.attending_dinner(@event.dinner)
    when 'false'
      @people.declined_dinner(@event.dinner)
    else
      people
    end
  end

  def role
    (params[:role] ||= {"judge" => "judge"}).map { |k,v| v }
  end

  def status
    (params[:status] ||= {"confirmed" => "confirmed"}).map { |k, v| v }
  end

  def vims
    if params[:vims] != 'true' && params[:vims] != 'false'
      params[:vims] = nil
    end
    params[:vims] || [true, false, nil]
  end
end
