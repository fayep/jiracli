class JiraCLI < Thor
  desc 'comment TICKET', 'comment on a named ticket'
  def comment(ticket, comment)
    @issues=Jira::Issues.new
    issuequery={:jql=>"key='#{ticket}'", :fields=>'summary', :maxResults=>2}
    issue=@issues.get(issuequery).first
    updates={'update'=>{'comment'=>[{'add'=>{'body'=>comment}}]}}
    @issues.put(issue, updates)
  end
end
