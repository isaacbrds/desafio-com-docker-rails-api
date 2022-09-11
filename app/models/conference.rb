class Conference < ApplicationRecord
  validates :title, presence: true
  has_many :tracks, dependent: :destroy
end
