class JiraCLI < Thor
  option :raw
  desc 'lastcomments TICKET [NUMCOMMENTS]', 'show the last 1 (or NUMCOMMENTS) comments in TICKET'
  def lastcomments(ticket, num_comments=1)
    @issues = Jira::Issues.new
    issue={:jql=>"key='#{ticket}'", :fields=>'*all', :expand=>'names,metadata',:maxResults=>2}
    @issues.get(issue).map{|i|
      j = i['fields']
      if j['comment'].nil?
        j['comment'] = {}
        j['comment']['comments'] = []
      end
      j['ref'] = i['key'];

      template = eval('"%s"' % File.read(File.expand_path('../../../config/just_comments.erb',__FILE__)))

      j['num_comments'] = num_comments.to_i

      puts Erubis::Eruby.new(template).result(j)
    }
  end
end
