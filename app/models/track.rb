class Track < ApplicationRecord
  belongs_to :conference
  has_many :sessions, dependent: :destroy

  validates :title, presence: true
end
