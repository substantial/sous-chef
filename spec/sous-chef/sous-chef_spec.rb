require 'spec_helper'

describe SousChef do

  subject { SousChef }

  it "keeps track of agents" do
    subject.agents = "some agents"
    subject.agents.should == 'some agents'
  end
end

