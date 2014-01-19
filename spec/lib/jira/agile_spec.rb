require_relative '../../spec_helper'

describe Jira::Sprints do

  before :all do
    @sprints = Jira::Sprints.new
  end

  it "should return an instance of Jira::Sprints" do
    @sprints.should be_instance_of Jira::Sprints
  end

  it "should return an array of sprints" do
    @sprints.get.should be_instance_of Array
    @sprints.get.first.should have_key('id')
    @sprints.get.first.should have_key('name')
    @sprints.get.first.should have_key('state')
  end

  it "should find the 'Active' sprint" do
    @sprints.active.should be_instance_of Hash
    @sprints.active['state'].should eql('ACTIVE')
  end

  it "should allow us to set a ticket into this sprint" do
    @issues = Jira::Issues.new
    issuesinsprint = {:jql=>"sprint='#{@sprints.active['name']}' AND assignee='#{Jira::Config.username}'",:maxResults=>1}
    testissue=@issues.get(issuesinsprint).first['key']
    @sprints.addIssuesToSprint(@sprints.active['id'].to_i, [testissue])
  end

end
