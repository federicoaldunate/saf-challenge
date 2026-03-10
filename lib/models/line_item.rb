class LineItem
  attr_reader :item, :quantity

  def initialize(item:, quantity:)
    @item = item
    @quantity = quantity
  end

  def total_price
    @item.price * @quantity
  end

  def print
    puts "#{@quantity} #{@item.name}: #{total_price.round(2)}"
  end
end