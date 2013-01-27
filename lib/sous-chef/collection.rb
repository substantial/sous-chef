class SousChef::Collection
  attr_reader :children, :name

  def initialize(name)
    @children = {}
    @name = name
  end

  def []=(name, item)
    @children[name] = item
  end

  def [](name)
    @children[name]
  end

end

