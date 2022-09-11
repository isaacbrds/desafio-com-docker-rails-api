require 'rails_helper'

RSpec.describe Lecture, type: :model do
  it {is_expected.to validate_presence_of(:title)}
  it {is_expected.to validate_presence_of(:start_time)}
  it {is_expected.to validate_presence_of(:end_time)}

  describe 'relations' do
    it {is_expected.to belong_to(:session)}
  end
end
