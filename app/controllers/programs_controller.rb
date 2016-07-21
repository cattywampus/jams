class ProgramsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def new
    @program = Program.new
  end

  def create
    @program = Program.new program_params

    respond_to do |format|
      if @program.save
        format.html { redirect_to @program, notice: "Created #{@program.abbr} program." }
      else
        format.html { render action: "new" }
      end
    end
  end

  def index
    @programs = Program.all
  end

  def edit
    @program = Program.find params[:id]
  end

  def update
    @program = Program.find params[:id]

    respond_to do |format|
      if @program.update_attributes program_params
        format.html { redirect_to @program, notice: "#{@program.abbr} program updated successfully." }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def show
    @program = Program.find params[:id]
  end

  def destroy
    @program = Program.find params[:id]
    @program.destroy

    respond_to do |format|
      format.html { redirect_to programs_path, notice: "#{@program.abbr} program was deleted." }
    end
  end

  private

  def program_params
    params.require(:program).permit(:abbr, :icon, :logo, :name)
  end
end
