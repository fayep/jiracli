
class JiraCLI < Thor
  option :raw
  option :summary
  desc 'show', 'show a named ticket'
  def show(ticket)
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
      case
      when options[:raw]
        puts j.to_json
      when options[:summary]
        puts "#{j['ref']}: #{j['summary']}"
      else
        template=eval('"%s"' % File.read(File.expand_path('../../../config/issue.erb',__FILE__)))
        puts Erubis::Eruby.new(template).result(j)
      end
    }
  end
end
