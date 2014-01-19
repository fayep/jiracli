require_relative '../../spec_helper'

describe Jira::Fields do

  it "should be a singleton" do
    Jira::Fields.get.should equal Jira::Fields.get
  end

  it "should return an array of fields" do
    Jira::Fields.get.should be_instance_of Array
    Jira::Fields.get.first.should have_key "id"
    Jira::Fields.get.first.should have_key "name"
    Jira::Fields.get.first.should have_key "custom"
    Jira::Fields.get.first.should have_key "schema"
  end

  it "should find the 'Key' field" do
    Jira::Fields['name'=>'Key'].should be_instance_of Hash
  end

  it "should find the 'Rank' field (because user/pass is good)" do
    Jira::Fields['name'=>'Rank'].should be_instance_of Hash
  end

end

describe Jira::Issues do

  before :all do
    @issues = Jira::Issues.new
  end

  it "should return some issues for project" do
    quicktest={:jql=>"project='#{Jira::Config.project}'", :fields=>'summary', :maxResults=>2}
    @issues.get(quicktest).should be_instance_of Array
  end

  it "should cache on queryhash" do
    quicktest={:jql=>"project='#{Jira::Config.project}'", :fields=>'summary', :maxResults=>2}
    othertest={:jql=>"project='#{Jira::Config.project}'", :fields=>'summary,assignee', :maxResults=>2}
    @issues.get(quicktest).should equal @issues.get(quicktest)
    @issues.get(quicktest).should equal @issues.get
    @issues.get(othertest).should equal @issues.get
    @issues.get(quicktest).should_not equal @issues.get(othertest)
  end

  it "should produce the same uri for different references to the same issue" do
    quicktest={:jql=>"project='#{Jira::Config.project}'", :fields=>'summary', :maxResults=>2}
    issue=@issues.get(quicktest).first
    uri = @issues.uri_for(issue)
    uri.should include(issue['id'].to_s)
    @issues.uri_for('key'=>issue['key']).should eql(uri)
    @issues.uri_for(issue['key']).should eql(uri)
  end

  it "should assign your ticket back to you" do
    quicktest={:jql=>"assignee='#{Jira::Config.username}'", :fields=>'summary', :maxResults=>2}
    issue=@issues.get(quicktest).first
    updates={'update'=>{'assignee'=>[{'set'=>{'name'=>Jira::Config.username}}]}}
    @issues.put(issue,updates)
  end

end
