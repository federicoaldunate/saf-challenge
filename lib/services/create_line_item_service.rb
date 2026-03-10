module Services
  class CreateLineItemService
    attr_reader :input_line

    # Given a line of input, creates a line item object

    def initialize(input_line)
      @input_line = input_line
    end
    
    def call
      item_attributes = ::Services::InterpreterService.new(@input_line).call
      item = ::Models::Item.new(
        name: item_attributes[:name],
        price: item_attributes[:price],
        type: item_attributes[:type],
        imported: item_attributes[:imported]
      )

      ::Models::LineItem.new(item: item, quantity: item_attributes[:quantity])
    end
  end
end
