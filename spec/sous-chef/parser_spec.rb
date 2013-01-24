require 'spec_helper'

describe SousChef::Parser do
  describe "#initialize" do
    let(:parser) { SousChef::Parser.new('some config file') }

    it 'sets config file' do
      parser.config_file.should == 'some config file'
    end
  end

  describe "#parse" do
    subject { SousChef::Parser.new(File.join(SPEC_ROOT, "fixtures", "some_nodes.yml")).parse }

    it "parses yaml" do
      subject.keys.should =~ %w[SuperAwesomeNode OtherAwesome]
    end
  end
end

