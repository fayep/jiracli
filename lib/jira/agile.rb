module Jira
  class Agile < RestData

    def base_url
      @uri ||= Config.agile_url.to_uri(:username=>Config.username, :password=>Config.password)
    end

  end

  class Sprints < Agile

    def get
      # get all the sprints.
      @sprints ||= base_url["/sprintquery/#{Config.rapidview}"].get.deserialize['sprints']
    end

    def active
      self['state'=>'ACTIVE']
    end

    def addIssuesToSprint(sprintId,issueList)
      updates = {"idOrKeys"=>issueList,"customFieldId"=>Fields['name'=>'Rank']['customId'], "sprintId"=> sprintId, "addToBacklog"=>false}
      base_url['/sprint/rank'].put(updates.to_json,{'Content-Type'=>'application/json'})
    end
  end
end
