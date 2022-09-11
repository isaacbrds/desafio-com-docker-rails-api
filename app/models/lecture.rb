class Lecture < ApplicationRecord
  belongs_to :session
  validates :title, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
