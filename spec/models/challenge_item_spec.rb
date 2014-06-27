require 'spec_helper'

describe ChallengeItem do
  it { should belong_to(:challenge) }

  describe "#completed?" do
    let(:challenge_item) { ChallengeItem.create(content: "Hello") }

    it "is false when completed_is blank" do
      challenge_item.completed_at = nil
      expect(challenge_item.completed?).to be_false
    end

    it "returns true when completed_at is not empty" do
      challenge_item.completed_at = Time.now
      expect(challenge_item.completed?).to be_true
    end
  end
end
