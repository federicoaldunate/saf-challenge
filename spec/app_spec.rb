require "spec_helper"

RSpec.describe App do
  subject(:app) { described_class.new }

  def input_for(n)
    File.open(File.join(__dir__, "../inputs/input#{n}.txt"))
  end

  def expected_output_for(n)
    File.read(File.join(__dir__, "../outputs/expected_output#{n}.txt")).chomp + "\n"
  end

  describe "#execute" do
    [1, 2, 3, 4, 5].each do |n|
      context "with input #{n}" do
        it "produces the correct receipt" do
          expect { app.execute(input_for(n)) }.to output(expected_output_for(n)).to_stdout
        end
      end
    end
  end
end
