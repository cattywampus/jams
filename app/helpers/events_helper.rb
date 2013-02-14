module EventsHelper
  def active_tab?(name)
    controller_name == name ? "active" : ""
  end

  def status_class(status)
    case status
    when :confirmed
      "text-success"
    when :invited, :wait_list
      "text-warning"
    when :declined, :withdrew, :no_show
      "text-error"
    else
      "text-info"
    end
  end
end
