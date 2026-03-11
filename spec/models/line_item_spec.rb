require "spec_helper"

RSpec.describe Models::LineItem do
  let(:item) { Models::Item.new(name: "music CD", price: BigDecimal("14.99"), type: "other", imported: false) }

  subject(:line_item) { described_class.new(item: item, quantity: 2) }

  describe "#unit_price" do
    it "returns the item price" do
      expect(line_item.unit_price).to eq(BigDecimal("14.99"))
    end
  end

  describe "#total_price" do
    it "returns unit price multiplied by quantity" do
      expect(line_item.total_price).to eq(BigDecimal("29.98"))
    end
  end

  describe "#type" do
    it "delegates to item" do
      expect(line_item.type).to eq("other")
    end
  end

  describe "#imported?" do
    context "when item is not imported" do
      it { is_expected.not_to be_imported }
    end

    context "when item is imported" do
      let(:item) { Models::Item.new(name: "imported bottle of perfume", price: BigDecimal("27.99"), type: "other", imported: true) }

      it { is_expected.to be_imported }
    end
  end
end
