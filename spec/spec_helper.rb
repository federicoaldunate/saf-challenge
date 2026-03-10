$LOAD_PATH.unshift(File.expand_path("../lib", __dir__))

Dir[File.join(__dir__, "../lib/**/*.rb")].sort.each { |f| require f }

require "rspec"