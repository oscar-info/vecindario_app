require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "validations" do
    it "validate presence of required fields" do
      should validate_presence_of(:name)
      should validate_presence_of(:last_name)
      should validate_presence_of(:phone)
      should validate_presence_of(:email)
      should validate_presence_of(:auth_token)
    end

    it "validate relations" do
    should have_many(:projects)
    end
  end
end
