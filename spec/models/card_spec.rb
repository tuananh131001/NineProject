RSpec.describe Card do
  describe "#activate_card" do
    subject { card.activate_card(card_params) }

    let!(:card) { create(:card) }
    let(:card_params) { { activation_code: card.activation_code } }

    it "activates the card" do
      expect(subject.status).to eq("issued")
    end

    it "generates a pin code" do
      expect(subject.pin_code).to be_present
    end
  end
end
