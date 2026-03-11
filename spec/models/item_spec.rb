require "spec_helper"

RSpec.describe Models::Item do
  subject(:item) { described_class.new(name: "music CD", price: BigDecimal("14.99"), type: "other", imported: false) }

  describe "#imported?" do
    context "when not imported" do
      it { is_expected.not_to be_imported }
    end

    context "when imported" do
      subject(:item) { described_class.new(name: "imported bottle of perfume", price: BigDecimal("27.99"), type: "other", imported: true) }

      it { is_expected.to be_imported }
    end
  end

  describe "defaults" do
    subject(:item) { described_class.new(name: "book", price: BigDecimal("12.49"), type: "book") }

    it "defaults imported to false" do
      expect(item.imported).to be false
    end
  end
end
