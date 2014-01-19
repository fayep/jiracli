class JiraCLI < Thor
  desc 'work', 'work on a named ticket'
  def work(ticket)
    @issues = Jira::Issues.new
    @sprint = Jira::Sprints.new
    sprintid=@sprint.current['id'].to_i
    @issues.addIssuesToSprint(sprintid, [ticket])
  end
end
