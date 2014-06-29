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

  describe "#toggle_completion!" do
    let(:challenge_item) { create(:challenge_item) }
    it "updates the completed_at attribute to the current time if nil" do
      challenge_item.update_attribute(:completed_at, nil)
      expect{ challenge_item.toggle_completion! }.to change{ challenge_item.completed_at }
      expect(challenge_item.completed_at).to be_an_instance_of(ActiveSupport::TimeWithZone)
    end

    it "update completed_at to nil if set" do
      challenge_item.update_attribute(:completed_at, Time.now)
      expect{ challenge_item.toggle_completion! }.to change{ challenge_item.completed_at }
      expect( challenge_item.completed_at ).to be_nil
    end

  end
end
