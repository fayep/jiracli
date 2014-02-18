class JiraCLI < Thor
  desc 'work TICKET', 'work on a named ticket'
  def work(ticket)
    @issues = Jira::Issues.new
    @sprint = Jira::Sprints.new
    sprintid=@sprint.active['id'].to_i
    @sprint.addIssuesToSprint(sprintid, [ticket])
  end
end
