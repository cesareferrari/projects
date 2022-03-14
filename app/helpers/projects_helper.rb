module ProjectsHelper
  def status_for(project)
    classes = %w(inline-block px-2 py-1 text-xs uppercase text-white bg-indigo-600 rounded-sm)
    if project.done?
      content_tag(:span, "Done", class: "#{classes.join(" ")} bg-indigo-600")
    else
      content_tag(:span, "Active", class: "#{classes.join(" ")} bg-green-600")
    end
  end

  def date_for(project)
    if project.done?
      return content_tag(:span,
                       "done on #{project.updated_at.to_fs}",
                        class: "uppercase text-xs")
    end

    content_tag(:span, project.created_at.to_fs,
                class: "uppercase text-xs")
  end

  def priority_for(project)
    unless project.done?
      content_tag(:div, project.priority,
              class: "w-6 h-6 p-2 rounded-full bg-indigo-400 flex justify-center items-center text-white font-bold text-sm" )
    end
  end

  def cover(project)
    if project.cover.attached?
      image_tag project.cover.variant(resize_to_limit: [150, nil])
    else
      image_tag "placeholder.png"
    end
  end
end
