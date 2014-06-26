class ChallengeItem < ActiveRecord::Base
  belongs_to :challenge

  validates :content, presence: true,
                      length: { minimum: 3 }
end
