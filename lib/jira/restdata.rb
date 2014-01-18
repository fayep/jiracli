module Jira
  class RestData

    def [](p)
      # return the first hash where all our incoming pairs match
      get.select{|i| p.reject { |k,v| i[k]!=v }.length == p.length }.first
    end

  end
end
