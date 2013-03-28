class Reports::NamecardsController < ApplicationController
  def show
    @event = Event.find params[:event_id]

    if params[:cards_for] == "dinner"
      @people = @event.dinner.attendees.attending.joins(:person)
    else
      @people = @event.judges.confirmed.joins(:person)
    end
    @people = @people.order("people.last_name ASC, people.first_name ASC")
  end

end
