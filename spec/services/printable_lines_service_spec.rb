# spec/services/printable_lines_service_spec.rb

require "spec_helper"

RSpec.describe Services::PrintableLinesService do
  describe "#call" do
    let(:item) { instance_double("Item", name: "book") }

    let(:line_item) do
      instance_double(
        "LineItem",
        quantity: 2,
        total_price: 24.98,
        item: item
      )
    end

    let(:tax_service) { instance_double("Services::CalculateTaxService", call: 0.0) }

    before do
      allow(Services::CalculateTaxService)
        .to receive(:new)
        .with(line_item: line_item)
        .and_return(tax_service)
    end

    it "returns printable lines with totals" do
      result = described_class.new(line_items: [line_item]).call

      expect(result).to eq([
        "2 book: 24.98",
        "Sales Taxes: 0.00",
        "Total: 24.98"
      ])
    end
  end
end
