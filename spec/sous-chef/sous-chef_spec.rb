require 'spec_helper'

describe SousChef do
  describe "#create_config" do
    let(:template_location) { SousChef::CONFIG_TEMPLATE }
    let(:config_location) { SousChef::CONFIG_FILE }

    it "should copy nodes.yml if none exist" do
      File.stub(exists?: false)
      FileUtils.should_receive(:cp).with(template_location, config_location)
      SousChef.create_config
    end

    it "shouldn't copy nodes.yml if one already exists" do
      File.stub(exists?: true)
      FileUtils.should_not_receive(:cp).with(template_location, config_location)
      SousChef.create_config
    end
  end
end

