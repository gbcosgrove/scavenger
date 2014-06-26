class Challenge < ActiveRecord::Base
  validates :title, presence: true
  validates :title, length: { minimum: 5 }
end
