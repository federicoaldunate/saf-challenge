require "spec_helper"

RSpec.describe Services::CalculateTaxService do
  describe "#call" do
    subject(:result) { described_class.new(line_item:).call }

    context "with a basic item" do
      let(:line_item)  { Services::CreateLineItemService.new("1 book at 12.49").call }

      it "parses the line correctly" do
        expect(result).to eq(0.0)
      end
    end

    context "with an imported item" do
      let(:line_item)  { Services::CreateLineItemService.new("1 imported bottle of perfume at 47.50").call }
      # 15% tax
      it "parses the line correctly" do
        expect(result).to eq(7.15)
      end
    end

    context "with an imported food item" do
      let(:line_item)  { Services::CreateLineItemService.new("1 imported box of chocolates at 10.00").call }
      # 5% tax
      it "parses the line correctly" do
        expect(result).to eq(0.5)
      end
    end

    # from input3
    context "with several imported food items" do
      let(:line_item)  { Services::CreateLineItemService.new("3 imported boxes of chocolates at 11.25").call }
      # 5% tax
      it "parses the line correctly" do
        expect(result).to eq(1.8)
      end
    end
  end
end
