class ChallengeItem < ActiveRecord::Base
  belongs_to :challenge

  validates :content, presence: true,
                      length: { minimum: 2 }

  scope :complete, -> { where("completed_at is not null") }
  scope :incomplete, -> { where(completed_at: nil) }

  def completed?
    !completed_at.blank?
  end
end

