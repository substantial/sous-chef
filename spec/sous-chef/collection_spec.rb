require 'spec_helper'

describe SousChef::Collection do
  let(:nodes) { {} }
  let(:collection) { SousChef::Collection.new('some collection') }

  subject { collection }

  describe "#initialize" do
    it "should set the name" do
      subject.name.should == 'some collection'
    end
  end

  describe "#[]= & #[]" do
    it "should behave like a hash" do
      subject['foo'] = {bar: 'baz'}
      subject['foo'].should == {bar: 'baz'}
    end
  end

  describe "#has_key?" do
    it "should behave like a hash" do
      subject['some_key'] = true
      subject.has_key?('some_key')
    end
  end
end

