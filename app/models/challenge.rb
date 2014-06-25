class Challenge < ActiveRecord::Base
  validates :title, presence: true
end
