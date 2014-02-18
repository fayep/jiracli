class JiraCLI < Thor
  desc 'feature', 'list feature tickets\n[--id=FEATUREID] list tickets in feature'
  method_option :id, :required => false, :aliases => '-i'
  def feature
    @issues = Jira::Issues.new
    if options[:id] == ""
      issuelist={:jql=>"project='#{Jira::Config.project}' AND issuetype='feature' AND status='open'", :fields=>'summary',:maxResults=>100}
    else
      issuelist={:jql=>"'Feature Link'='#{options[:id]}' AND status='open'", :fields=>'summary',:maxResults=>100}
    end
    @issues.get(issuelist).map{|i|
	puts "%s: %s" % [ i['key'], i['fields']['summary'] ]
    }
  end
end
