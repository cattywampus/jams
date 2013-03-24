module Reports::BiographiesHelper
  def biography_badge(text)
    words = word_count(text)
    status = case words
    when 0..79
      "badge-warning"
    when 80..100
      "badge-success"
    else
      "badge-important"
    end

    content_tag :span, class: "badge #{status}" do
      pluralize words, "word"      
    end
  end
end
