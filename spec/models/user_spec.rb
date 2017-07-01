require 'rails_helper'

RSpec.describe User, type: :model do

  context "Validation" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:phone) }
    it { is_expected.to validate_presence_of(:country_code) }
  end
end
