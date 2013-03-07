class Tools::EmailBuilderController < ApplicationController
  layout "event"

  def show
    @event = Event.find params[:event_id]
    @people = Person.includes({:judge_history => :event})
      .where({events: {id: @event.id}, judges: {status: status, role: role, completed_vims: vims, attending_dinner: dinner}})
  end

private

  def dinner
    params[:attending_dinner] ||= "ignore"

    if params[:attending_dinner] == "rsvp"
      nil
    elsif params[:attending_dinner] == "ignore"
      [true, false, nil]
    else
      params[:attending_dinner]
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
