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
