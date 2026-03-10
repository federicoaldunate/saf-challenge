module Taxes
  class BasicSalesTax
    RATE = BigDecimal("0.10")
    EXEMPT = ["book", "food", "medical"].freeze

    def initialize(line_item:)
      @line_item = line_item
    end

    def apply?
      !EXEMPT.include?(@line_item.item.type)
    end
  end
end
