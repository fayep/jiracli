module Jira
  class Jira < RestData

    def base_url
      @@uri ||= Config.jira_url.to_uri(:username=>Config.username, :password=>Config.password)
    end

  end

  class Fields < Jira

    def self.[](params)
      @@instance ||= Fields.new
      @@instance[params]
    end

    def self.get
      @@instance ||= Fields.new
      @@instance.get
    end

    def refresh
      @fields = nil
      get
    end

    def get
      # get all the fields.
      @fields ||= base_url['/field'].get.deserialize
    end

  end

  class Issues < Jira

    def initialize
      super
      @issues={}
    end

    def refresh(params=nil)
      params ||= @lastparamsused
      @issues[params.hash] = nil
      @lastparamsused = params
      get
    end

    def get(params=nil)
      # make the [] function work on the latest result set
      params ||= @lastparamsused
      @lastparamsused = params
      @issues[params.hash] ||= base_url['/search'].get(params).deserialize['issues']
    end

    def uri_for(issue)
      case
      when issue.kind_of?(Hash)
        issueurl = nil
        result = nil
        case
	when issue.has_key?('self')
          issueurl=issue['self'].dup
        when issue.has_key?('key')
          result = self[issue]
        end
      when issue.kind_of?(String)
        issue = {'key'=>issue}
        result = self[issue]
      end
      if issueurl.nil?
        if result.nil? || result.empty?
          issueurl=get(issue).first['self']
        else
          issueurl=result['self']
        end
      end
      issueurl.slice! base_url.to_s
      issueurl
    end

    def put(issue,updates)
      base_url[uri_for(issue)].put(updates.to_json,{'Content-Type'=>'application/json'})
    end

  end

end
