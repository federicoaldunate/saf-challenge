require "spec_helper"

RSpec.describe Services::InterpreterService do
  describe "#call" do
    subject(:result) { described_class.new(input_line).call }

    context "with a basic item" do
      let(:input_line) { "1 book at 12.49" }

      it "parses the line correctly" do
        expect(result).to eq(
          quantity: 1,
          name: "book",
          price: 12.49,
          type: "book",
          imported: false
        )
      end
    end

    context "with an imported item" do
      let(:input_line) { "1 imported bottle of perfume at 27.99" }

      it "detects imported items" do
        expect(result[:imported]).to be true
      end
    end

    context "with a food item" do
      let(:input_line) { "1 chocolate bar at 0.85" }

      it "infers food type" do
        expect(result[:type]).to eq("food")
      end
    end

    context "with invalid input" do
      let(:input_line) { "" }

      it "raises an error" do
        expect { result }.to raise_error(ArgumentError)
      end
    end
  end
end
