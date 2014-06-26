class Challenge < ActiveRecord::Base
  validates :title, presence: true
  validates :title, length: { minimum: 5 }
  validates :description, presence: true
  validates :description, length: { minimum: 10 }
end
