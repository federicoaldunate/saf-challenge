class Item
  attr_reader :name, :price, :type

  def initialize(name:, price:, type:)
    @name = name
    @price = price
    @type = type
  end

  def basic_sales_tax?
    ["book", "food", "medical"].exclude?(@type)
  end
end