class PollsHookListener < Redmine::Hook::ViewListener
  def view_projects_show_left(context = {})
  return content_tag("p", "Custom content added to the left")
  # render_on :view_projects_show_left, partial: "polls/project_overview" 
  # app/views/polls/_project_overview.html.erb
  end

  def view_projects_show_right(context = {})
    return content_tag("p", "Custom content added to the right")
  end
end
