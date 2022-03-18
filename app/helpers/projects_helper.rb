module ProjectsHelper
  BG_COLORS = %w[
    bg-amber-200
    bg-amber-300
    bg-indigo-200
    bg-indigo-300
    bg-purple-300
    bg-stone-400
    bg-red-300
    bg-orange-300
    bg-emerald-300
    bg-cyan-300
  ]

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
    classes = "object-cover h-60 md:w-40 md:h-40 md:object-none mb-4 md:mb-0"
    bg_color = BG_COLORS[project.name.size.digits.first]

    placeholder_classes = "#{bg_color} #{classes} rounded flex justify-center items-center text-[220px] tracking-[-20px] overflow-hidden font-bold text-indigo-500"

    if project.cover.attached?
      image_tag project.cover.variant(resize_to_limit: [480, 480]), class: classes
    else
      content_tag(:div, project.name[0, 2], class: placeholder_classes)
    end
  end
end
