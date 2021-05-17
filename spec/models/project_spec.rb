require 'rails_helper'

RSpec.describe Project, type: :model do

  describe "validations" do
    it "validate presence of required fields" do
      should validate_presence_of(:name_project)
      should validate_presence_of(:type_project)
      should validate_presence_of(:city)
      should validate_presence_of(:address)
      should validate_presence_of(:price)
      should validate_presence_of(:area)
      should validate_presence_of(:restroom)
      should validate_presence_of(:list_emails)
      should validate_presence_of(:user_id)
    end

    it "validate relations" do
      should have_many(:leads)
    end
  end
end
