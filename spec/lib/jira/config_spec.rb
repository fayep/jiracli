describe Jira::Config do
  it "should contain a jira_url" do
     Jira::Config.jira_url.should eql("https://ticket.opower.com/rest/api/2")
  end

  it "should contain a username" do
     Jira::Config.username.should be_an_instance_of String
  end

  it "should contain a password" do
     Jira::Config.password.should be_an_instance_of String
  end
end
