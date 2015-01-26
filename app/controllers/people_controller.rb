class PeopleController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  # GET /people
  # GET /people.json
  def index
    @people = Person.text_search(params[:q])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @people, root: false }
    end
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @person = Person.find(params[:id])
    @comment = Comment.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @person, root: false }
    end
  end

  # GET /people/new
  # GET /people/new.json
  def new
    @person = Person.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @person }
    end
  end

  # GET /people/1/edit
  def edit
    @person = Person.find(params[:id])
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)

    if params[:event_id].present?
      @event = Event.find params[:event_id]
    end

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render json: @person, status: :created, location: @person }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /people/1
  # PUT /people/1.json
  def update
    @person = Person.find(params[:id])

    respond_to do |format|
      if @person.update_attributes(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url }
      format.json { head :no_content }
    end
  end
  
  private
  
  def person_params
    params.require(:person)
          .permit(:assistant_id, 
                  :company, 
                  :email, 
                  :first_name, 
                  :gender, 
                  :last_name, 
                  :middle_name,
                  :position,
                  :shirt_size, 
                  :suffix,
                  :title,
                  addresses_attributes: [:address_type, :city, :primary, :state, :street1, :street2, :zip], 
                  phone_numbers_attributes: [:phone_number, :primary, :phone_type])
  end
end
