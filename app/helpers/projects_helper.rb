module ProjectsHelper
  def status_for(project)
    classes = %w(inline-block mb-4 px-2 py-1 text-xs uppercase text-white bg-indigo-600 rounded-sm)
    if project.done?
      content_tag(:span, "Done", class: "#{classes.join(" ")} bg-indigo-600")
    else
      content_tag(:span, "Active", class: "#{classes.join(" ")} bg-green-600")
    end
  end
end
