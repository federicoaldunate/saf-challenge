module Services
  class PrintableLinesService
    attr_reader :line_items

    # Given a list of line items, prints each line item with the tax included, as well as the total tax and total amount at the end
    # We could have a way of creating a basket object that contains the line items, and then this service could take a basket as an argument instead of a list of line items.
    # But for simplicity, we can just pass the list of line items directly to this service.
    def initialize(line_items:)
      @line_items = line_items
      @total_tax = 0.0
      @total_amount = 0.0
      @printable_lines = []
    end

    # A case can be made that this service has more responsabilities than it should,
    # like calculating the total tax and total amount, but I think it's fine for this service to be responsible for printing the lines with the tax,
    # as well as the total tax and total amount at the end. If we wanted to separate these concerns, we could have a separate service that calculates the total tax and total amount,
    # but I think it's fine to keep it all in one service for simplicity.
    def call
      line_items.each do |line_item|
        tax_amount = ::Services::CalculateTaxService.new(line_item: line_item).call

        @total_tax += tax_amount
        @total_amount += line_item.total_price + tax_amount

        print_line_with_tax(line_item, tax_amount)
      end
      printable_lines <<  "Sales Taxes: #{total_tax.round(2)}" #Rounding shouldn't be needed here, but just in case of floating point issues, we round to 2 decimals
      printable_lines <<  "Total: #{total_amount.round(2)}" #Rounding shouldn't be needed here, but just in case of floating point issues, we round to 2 decimals

      printable_lines
    end

    private

    attr_reader :total_tax, :total_amount, :printable_lines

    def print_line_with_tax(line_item, tax_amount)
      total_price_with_tax = line_item.total_price + tax_amount
      printable_lines << "#{line_item.quantity} #{line_item.item.name}: #{total_price_with_tax.round(2)}"
    end
  end
end
