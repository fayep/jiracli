class JiraCLI < Thor
  desc 'unassigned', 'show unassigned tickets'
  def unassigned
    @issues = Jira::Issues.new
    unassigned={:jql=>"assignee=NULL AND project='#{Jira::Config.project}'", :fields=>'summary',:maxResults=>20}
    @issues.get(unassigned).map{|i|
	puts "%s: %s" % [ i['key'], i['fields']['summary'] ]
    }
  end
end
