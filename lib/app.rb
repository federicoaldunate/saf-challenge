# frozen_string_literal: true
# 


# I will require bigdecimal because is part of the standard library and is used for precise decimal arithmetic,
# which is important for handling prices and taxes in this application.
require 'bigdecimal'

$LOAD_PATH.unshift(File.expand_path("../lib", __dir__))

Dir[File.join(__dir__, "../lib/models/**/*.rb")].sort.each { |f| require f }
Dir[File.join(__dir__, "../lib/taxes/**/*.rb")].sort.each { |f| require f }
Dir[File.join(__dir__, "../lib/services/**/*.rb")].sort.each { |f| require f }


class App
  def execute(io)
    line_items = parse(io)
    print_receipt(line_items)
  end

  private

  def parse(io)
    line_items = []
    io.each_line do |line|
      line_items << Services::CreateLineItemService.new(line).call
    end
    line_items
  end

  def print_receipt(line_items)
    printable_lines = Services::PrintableLinesService.new(line_items:).call

    printable_lines.each { |line| puts line }
  end
end
