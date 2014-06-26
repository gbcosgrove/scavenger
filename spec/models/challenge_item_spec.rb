require 'spec_helper'

describe ChallengeItem do
  it { should belong_to(:challenge) }
end
