module Taxes
  class ImportedDutyTax
    RATE = BigDecimal("0.05")
    
    def initialize(line_item:)
      @line_item = line_item
    end

    def rate = RATE

    def apply?
      @line_item.imported?
    end
  end
end
