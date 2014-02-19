class JiraCLI < Thor
  desc 'version', 'show jira cli version'
  def version
    puts "jira #{Jira::VERSION}"
  end
end
