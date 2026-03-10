module Models
  class LineItem
    attr_reader :item, :quantity

    def initialize(item:, quantity:)
      @item = item
      @quantity = quantity
    end

    def total_price
      unit_price * quantity
    end

    def unit_price
      item.price
    end

    def type = item.type
    def imported? = item.imported?
  end
end
