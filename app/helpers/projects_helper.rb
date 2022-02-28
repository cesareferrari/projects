module ProjectsHelper
  def status_for(project)
    if project.done?
      content_tag(:span, "Done", class: "px-2 py-1 text-xs uppercase text-white bg-indigo-600 rounded-sm ")
    else
      content_tag(:span, "Active", class: "px-2 py-1 text-xs uppercase text-white bg-green-600 rounded-sm")
    end
  end
end
