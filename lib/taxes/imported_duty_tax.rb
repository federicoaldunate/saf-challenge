module Taxes
  class ImportedDutyTax
    RATE = BigDecimal("0.05")
    
    def initialize(line_item:)
      @line_item = line_item
    end

    def apply?
      @line_item.item.imported?
    end
  end
end
