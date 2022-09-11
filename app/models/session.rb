class Session < ApplicationRecord
  belongs_to :track
  has_many :lectures, dependent: :destroy
  validates :shift, presence: true
end
