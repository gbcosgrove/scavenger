class Challenge < ActiveRecord::Base
  has_many :challenge_items

  validates :title, presence: true
  validates :title, length: { minimum: 5 }
  validates :description, presence: true
  validates :description, length: { minimum: 10 }
end
