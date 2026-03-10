module Services
  class CalculateTaxService
    attr_reader :line_item
    # Given a line item, calculates the total tax for that line item based on the rules:
    # - Basic sales tax is 10% for all goods except books, food, and medical products
    # - Import duty is an additional 5% for all imported goods
    # The tax is rounded to the nearest 0.05 and should be added to the total price of the line item
    TAX_ROUNDING_STEP = 0.05

    def initialize(line_item:)
      @line_item = line_item
    end

    def call
      tax_rate = 0.0
      tax_rate += 0.1 if line_item.item.basic_sales_tax?
      tax_rate += 0.05 if line_item.item.imported?
      
      round_up_to_nearest_requiered_float(line_item.total_price * tax_rate)
    end

    private

    def round_up_to_nearest_requiered_float(amount)
      (amount / TAX_ROUNDING_STEP).ceil * TAX_ROUNDING_STEP
    end
  end
end


