class Challenge < ActiveRecord::Base
  has_many :challenge_items

  validates :title, presence: true
  validates :title, length: { minimum: 5 }
  validates :description, presence: true
  validates :description, length: { minimum: 10 }

  def has_completed_items?
    challenge_items.complete.size > 0
  end

  def has_incomplete_items?
    challenge_items.incomplete.size > 0
  end
end
