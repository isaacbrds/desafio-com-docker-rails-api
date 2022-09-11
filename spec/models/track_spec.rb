require 'rails_helper'

RSpec.describe Track, type: :model do
  it {is_expected.to validate_presence_of(:title)}

  describe 'relations' do
    it {is_expected.to belong_to(:conference)}
  end

end
