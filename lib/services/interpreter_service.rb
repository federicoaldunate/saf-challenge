module Services
  class InterpreterService
    attr_reader :input_line

    # Given a line of input, creates a hash with this strucuture:
    # {
    #  #   quantity: 1,
    #  #   name: "book",
    #  #   price: 12.49,
    #  #   type: "book",
    #  #   imported: false
    #  }
    #  

    def initialize(input_line)
      @input_line = input_line
    end
    
    def call
      raise ArgumentError, "Input line cannot be empty" if @input_line.nil? || @input_line.strip.empty?

      quantity_str, rest = @input_line.split(" ", 2)
      raise ArgumentError, "Invalid input format" unless rest

      quantity = Integer(quantity_str)

      name_part, price_str = rest.split(" at ")
      raise ArgumentError, "Missing price" unless price_str

      price = BigDecimal(price_str).round(2)

      imported = name_part.include?("imported")
      type = infer_type(name_part)

      {
        quantity: quantity,
        name: name_part,
        price: price,
        type: type,
        imported: imported
      }
    rescue ArgumentError => e
      raise ArgumentError, "Invalid input line: '#{@input_line}' (#{e.message})"
    end

    private

    # this could become a new service, but for simplicity, I'm keeping it here for now
    def infer_type(name_part)
      if name_part.include?("book")
        "book"
      elsif name_part.include?("chocolate") || name_part.include?("food")
        "food"
      elsif name_part.include?("pills") || name_part.include?("medical")
        "medical"
      else
        "other"
      end
    end
  end
end
