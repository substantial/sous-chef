require 'spec_helper'

describe SousChef::Collection do
  let(:nodes) { {} }
  let(:collection) { SousChef::Collection.new('some collection') }

  describe "#initialize" do
    it "sets the name" do
      collection.name.should == 'some collection'
    end
  end

  describe "[]=" do
    subject { collection }

    it "it assigns to children" do
      subject['foo'] = {bar: 'baz'}
      subject.children.should == { 'foo' => { bar: 'baz' } }
    end
  end

  describe "[]" do
    subject { collection }

    it "it access children" do
      hash = { bar: 'baz' }
      subject['foo'] = hash
      subject.children['foo'].should == hash
    end
  end
end

