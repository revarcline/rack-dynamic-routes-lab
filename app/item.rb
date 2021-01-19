class Item
  attr_accessor :name, :price

  @all = []

  class << self
    attr_accessor :all
  end

  def initialize(name, price)
    @name = name
    @price = price
    self.class.all << self
  end

  def self.find_by_name(name)
    all.find { |item| item.name == name }
  end
end
