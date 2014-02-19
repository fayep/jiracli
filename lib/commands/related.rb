class JiraCLI < Thor
  option :raw
  desc 'related TICKET', 'show keys of issues related to TICKET'
  def related(ticket)
    @issues = Jira::Issues.new
    issue={:jql=>"key='#{ticket}'", :fields=>'*all', :expand=>'names,metadata',:maxResults=>2}
    @issues.get(issue).map{|i|
      j = i['fields']
      if j['issuelinks'].nil?
        j['issuelinks'] = {}
      end
      j['ref'] = i['key'];

      template = eval('"%s"' % File.read(File.expand_path('../../../config/just_linked_issues.erb',__FILE__)))

      puts Erubis::Eruby.new(template).result(j)
    }
  end
end
