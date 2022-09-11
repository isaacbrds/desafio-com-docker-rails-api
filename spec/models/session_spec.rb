require 'rails_helper'

RSpec.describe Session, type: :model do
  it {is_expected.to validate_presence_of(:shift)}

  describe 'relations' do
    it {is_expected.to belong_to(:track)}
  end

end
