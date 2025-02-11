
require_dependency File.expand_path('../lib/polls_hook_listener', __FILE__)

Redmine::Plugin.register :polls do
  name 'Polls plugin'
  author 'sumito.aita'
  description 'first sample plugin'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  # menu :application_menu, :polls, { controller: 'polls', action: 'index' }, caption: 'Polls!'
  # permission :view_polls, polls: :index
  # permission :vote_polls, polls: :vote
  project_module :polls do
    permission :view_polls, polls: :index
    permission :vote_polls, polls: :vote
  end
  menu :project_menu, :polls, { controller: 'polls', action: 'index' }, caption: 'Polls', after: :activity, param: :project_id

  # delete_menu_item :top_menu, :my_page
  # delete_menu_item :top_menu, :help
  # delete_menu_item :project_menu, :overview
  # delete_menu_item :project_menu, :activity
  # delete_menu_item :project_menu, :news

  settings default: {'empty' => true}, partial: 'settings/poll_settings'
end


