module Services
  class CalculateTaxService
    attr_reader :line_item
    # Given a line item, calculates the total tax for that line item based on the rules:
    # - Basic sales tax is 10% for all goods except books, food, and medical products
    # - Import duty is an additional 5% for all imported goods
    # The tax is rounded to the nearest 0.05 and should be added to the total price of the line item
    TAX_ROUNDING_STEP = 0.05
    BASIC_SALES_TAX = 0.1
    IMPORTED_DUTY = 0.05

    def initialize(line_item:)
      @line_item = line_item
    end

    def call
      tax_rate = 0.0
      tax_rate += BASIC_SALES_TAX if line_item.item.basic_sales_tax?
      tax_rate += IMPORTED_DUTY if line_item.item.imported?
      
      puts "Calculating tax for line item: #{line_item.quantity} #{line_item.item.name} at #{line_item.total_price.round(2)} with tax rate #{(tax_rate * 100).round(2)}%"
      round_up_to_nearest_requiered_float(line_item.unit_price * tax_rate) * line_item.quantity
    end

    private

    def round_up_to_nearest_requiered_float(amount)
      (amount / TAX_ROUNDING_STEP).ceil * TAX_ROUNDING_STEP
    end
  end
end


