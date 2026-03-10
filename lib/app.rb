class App  
  def parse(io)
    io.each_line do |line|
      puts "line:"
      puts line
      puts "eol"
    end
  end
end
