class JiraCLI < Thor
  desc 'list', 'show your tickets'
  def list
    @issues = Jira::Issues.new
    assigned={:jql=>"assignee='#{Jira::Config.username}' AND project='#{Jira::Config.project}'", :fields=>'summary',:maxResults=>20}
    @issues.get(assigned).map{|i|
	puts "%s: %s" % [ i['key'], i['fields']['summary'] ]
    }
  end
end
