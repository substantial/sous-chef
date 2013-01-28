require 'spec_helper'

describe SousChef::TaskBuilder do
  let(:node) { SousChef::Node.new('someNode', {}) }
  let(:collection) { SousChef::Collection.new('someCollection') }
  let(:nodes) { { 'collection' => collection, 'someNode' => node } }

  let(:task_builder) { SousChef::TaskBuilder.new(nodes)}

end

