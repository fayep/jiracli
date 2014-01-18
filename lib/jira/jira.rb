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

    def get(params)
      @issues[params.hash] ||= base_url['/search'].get(params).deserialize['issues']
    end

  end

end
