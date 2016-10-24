class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new team_attributes
    if @team.save
      redirect_to teams_path, notice: "The #{@team.name} team has been created."
    else
      render :new
    end
  end

  def show
    @team = Team.find params[:id]
  end

  private

  def team_attributes
    params.require(:team).permit(:name, :logo)
  end
end
