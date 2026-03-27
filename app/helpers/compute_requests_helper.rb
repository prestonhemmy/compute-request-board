module ComputeRequestsHelper
  def field_classes(record, field)
    base = "flex-1 shadow-sm rounded-md border px-3 py-2"

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
      priority_classes = 'bg-red-600'   # :urgent
    end

    common_classes = "px-2 py-1 rounded-md text-sm text-white font-medium"

    content_tag(:priority, priority, class: "#{common_classes} #{priority_classes}")
  end

  def status_badge(status)
    case status.to_sym
    when :submitted
      badge_classes = 'bg-gray-400 text-gray-800'
    when :approved
      badge_classes = 'bg-green-400 text-green-900'
    when :running
      badge_classes = 'bg-orange-400 text-orange-800'
    when :completed
      badge_classes = 'bg-blue-400 text-blue-800'
    else
      badge_classes = 'bg-red-600 text-white'   # :rejected
    end

    common_classes = "px-2 py-1 rounded-full text-sm font-medium"

    content_tag(:span, status, class: "#{common_classes} #{badge_classes}")
  end

  def status_indicator(status)
    case status.to_sym
    when :submitted
      status_class = "bg-gray-400"
    when :approved
      status_class = "bg-green-400"
    when :running
      status_class = "bg-orange-400"
    when :completed
      status_class = "bg-blue-400"
    else
      status_class = "bg-red-600"     # :rejected
    end

    common_classes = "block w-4 h-4 rounded-full"

    "#{common_classes} #{status_class}"
  end
end
