require 'spec_helper'

describe Challenge do
  it { should have_many(:challenge_items)}
end
