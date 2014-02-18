class JiraCLI < Thor
  option :raw
  desc 'lastcomments', 'show the last N comments in the named ticket'
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
      j['url'] = i['self'];
      if options[:raw]
        puts j.to_json
      else
        template = eval('"%s"' % File.read(File.expand_path('../../../config/just_comments.erb',__FILE__)))

        j['num_comments'] = num_comments.to_i

        puts Erubis::Eruby.new(template).result(j)
      end
    }
  end
end
