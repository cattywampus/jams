module ApplicationHelper
  
  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-danger alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def display_yes_no(value, nil_value=nil)
    if nil_value.present?
      if value.nil?
        content = nil_value
        emphasis = "text-danger"
      else
        content = value ? "Yes" : "No"
        emphasis = value ? "text-success" : ""
      end
    else
      content = value ? "Yes" : "No"
      emphasis = value ? "text-success" : "text-danger"
    end

    content_tag :span, content, class: emphasis
  end

  def word_count(value)
    value.scan(/[\w-]+/).size
  end
end
