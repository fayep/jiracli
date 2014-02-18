class JiraCLI < Thor
  desc 'feature [TICKET]', 'list feature tickets'
  def feature(id="")
    @issues = Jira::Issues.new
    if id == ""
      issuelist={:jql=>"project='#{Jira::Config.project}' AND issuetype='feature' AND status='open'", :fields=>'summary',:maxResults=>100}
    else
      issuelist={:jql=>"'Feature Link'='#{id}' AND status='open'", :fields=>'summary',:maxResults=>100}
    end
    @issues.get(issuelist).map{|i|
	puts "%s: %s" % [ i['key'], i['fields']['summary'] ]
    }
  end
end
