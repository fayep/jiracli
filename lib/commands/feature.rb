class JiraCLI < Thor
  desc 'feature [FEATURE]', 'List feature tickets'
  method_option :add, :type => :string, :desc => 'Add ticket to feature', :aliases => '-a', :banner => 'TICKET'
  def feature(id="")
    @issues = Jira::Issues.new
    if id == ""
      issuelist={:jql=>"project='#{Jira::Config.project}' AND issuetype='feature' AND status='open'", :fields=>'summary',:maxResults=>100}
    else
      issuelist={:jql=>"'Feature Link'='#{id}' AND status!='closed'", :fields=>'summary',:maxResults=>100}
    end
    @issues.get(issuelist).map{|i|
	puts "%s: %s" % [ i['key'], i['fields']['summary'] ]
    }
    if options.has_key?(:add) && options[:add] != ''
      issuequery={:jql=>"key='#{options[:add]}'", :fields=>'summary', :maxResults=>2}
      issue=@issues.get(issuequery).first
      updates={'update'=>{'Feature Link'=>[{'set'=>'#{id}'}]}}
      @issues.put(issue, updates)
    end
  end
end
