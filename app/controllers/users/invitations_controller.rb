class Users::InvitationsController < Devise::InvitationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:invite, keys: [:name])
  end

  private

  # this is called when creating invitation
  # should return an instance of resource class
  def invite_resource
    super do |u|
      assign_teams(u)
    end
  end

  def assign_teams(user)
    Team.find(role_params.map { |r| r[:team_id] }).each_with_index do |team, index|
      role = sanitize_role(role_params[index][:name])
      user.add_role(role, team)
    end
  end

  def role_params
    params[:roles]
  end

  def sanitize_role(name)
    Team::ROLES.find { |role| role == name.to_s.downcase }
  end
end
