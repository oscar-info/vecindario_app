require 'rails_helper'

RSpec.describe Lead, type: :model do
  
  describe "validations" do
    it "validate presence of required fields" do
      should validate_presence_of(:name)
      should validate_presence_of(:last_name)
      should validate_presence_of(:phone)
      should validate_presence_of(:email)
      should validate_presence_of(:creation_date)
      should validate_presence_of(:project_id)
    end
  end
end
