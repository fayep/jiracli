class JiraCLI < Thor
  desc 'version', 'show jira version'
  def version
    puts "jira #{Jira::VERSION}"
  end
end
