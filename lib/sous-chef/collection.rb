require 'forwardable'

class SousChef::Collection
  extend Forwardable

  attr_reader :name
  def_delegators :@children, :[], :[]=, :has_key?, :each

  def initialize(name)
    @name = name
    @children = {}
  end
end

