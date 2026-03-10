# frozen_string_literal: true
# 


# I will require bigdecimal because is part of the standard library and is used for precise decimal arithmetic,
# which is important for handling prices and taxes in this application.
require 'bigdecimal'

$LOAD_PATH.unshift(File.expand_path("../lib", __dir__))

Dir[File.join(__dir__, "../lib/**/*.rb")].sort.each { |f| require f }


class App
  def parse(io)
    line_items = []
    io.each_line do |line|
      line_items << Services::CreateLineItemService.new(line).call
    end

    printable_lines = Services::PrintableLinesService.new(line_items:).call

    printable_lines.each { |line| puts line }
  end
end
