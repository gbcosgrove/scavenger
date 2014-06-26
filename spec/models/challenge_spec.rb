require 'spec_helper'

describe Challenge do
  it { should have_many(:challenge_items)}

    describe "#has_complete_items?" do
    let(:challenge) { Challenge.create(title: "Finish this app", description: "Make it actually work")}

    it "returns true with completed challenge items" do
      challenge.challenge_items.create(content: "Finish the data models", completed_at: 1.minute.ago)
      expect(challenge.has_completed_items?).to be_true
    end

    it "returns false with no completed challenge items" do
      challenge.challenge_items.create(content: "Finish the data models")
      expect(challenge.has_completed_items?).to be_false
    end
  end
end
