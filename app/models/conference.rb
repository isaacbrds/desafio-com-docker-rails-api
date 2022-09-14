class Conference < ApplicationRecord
  has_many :tracks, dependent: :destroy
  
  has_one_attached :file
  
  validates :title, presence: true
  validates :file, presence: true
end
