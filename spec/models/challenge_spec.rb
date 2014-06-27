require 'spec_helper'

describe Challenge do
  it { should have_many(:challenge_items) }

  describe "#has_complete_items?" do
    let(:challenge) { Challenge.create(title: "Create an App", description: "Test the App") }

    it "returns true with completed challenge items" do
      challenge.challenge_items.create(content: "Work really hard", completed_at: 1.minute.ago)
      expect(challenge.has_completed_items?).to be_true
    end

    it "returns false with no completed challenge items" do
      challenge.challenge_items.create(content: "Work really hard")
      expect(challenge.has_completed_items?).to be_false
    end
  end

  describe "#has_incomplete_items?" do
    let(:challenge) { Challenge.create(title: "Create an App", description: "Test the App") }

    it "returns true with incompleted challenge items" do
      challenge.challenge_items.create(content: "Work really hard")
      expect(challenge.has_incomplete_items?).to be_true
    end

    it "returns false with no incomplete challenge items" do
      challenge.challenge_items.create(content: "Work really hard", completed_at: 1.minute.ago)
      expect(challenge.has_incomplete_items?).to be_false
    end
  end

end
