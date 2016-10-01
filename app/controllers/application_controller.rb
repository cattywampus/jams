class ApplicationController < ActionController::Base
  protect_from_forgery

  layout "default"

  before_action :set_paper_trail_whodunnit

  def info_for_paper_trail
    { ip: request.remote_ip, whodunnit_name: current_user.try(:name), controller: controller_name }
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

end
