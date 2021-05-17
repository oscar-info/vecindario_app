FactoryBot.define do
  factory :project do
    name_project { Faker::Mountain.name }
    type_project { "Apartment" }
    city { "Cali" }
    address { Faker::Address.street_address }
    price { 1 }
    area { 1 }
    subsidy { Faker::Boolean.boolean }
    restroom { Faker::Number.between(from: 1, to: 3) }
    parking { Faker::Boolean.boolean }
    list_emails { "ListOfEmails" }
    user
  end
end
