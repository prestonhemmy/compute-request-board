module ComputeRequestsHelper
  def field_classes(record, field)
    base = "shadow-sm rounded-md border px-3 py-2 w-3/4"
    if record.errors[field].any?
      "#{base} border-red-400 focus:outline-red-600"
    else
      "#{base} border-gray-400 focus:outline-blue-600"
    end
  end

  def priority_badge(priority)
    case priority.to_sym
    when :low
      priority_classes = 'bg-gray-500'
    when :medium
      priority_classes = 'bg-yellow-600'
    when :high
      priority_classes = 'bg-orange-600'
    else
      priority_classes = 'bg-red-700'   # :urgent
    end

    common_classes = "px-2 py-1 rounded-md text-sm text-white font-medium"

    content_tag(:priority, priority, class: "#{common_classes} #{priority_classes}")
  end
  def status_badge(status)
    case status.to_sym
    when :submitted
      badge_classes = 'bg-gray-500 text-white'
    when :approved
      badge_classes = 'bg-green-500'
    when :running
      badge_classes = 'bg-orange-600'
    when :completed
      badge_classes = 'bg-blue-600'
    else
      badge_classes = 'bg-red-700'   # :rejected
    end

    common_classes = "px-2 py-1 rounded-full text-sm text-white font-medium"

    content_tag(:span, status, class: "#{common_classes} #{badge_classes}")
  end
end
