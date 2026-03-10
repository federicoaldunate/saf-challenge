module Models
  class Item
    attr_reader :name, :price, :type, :imported

    def initialize(name:, price:, type:, imported: false)
      @name = name
      @price = price
      @type = type
      @imported = imported
    end

    def imported?
      @imported
    end
  end
end
