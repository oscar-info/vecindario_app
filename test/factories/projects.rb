FactoryBot.define do
  factory :project do
    name_project { Faker::Lorem.word }
    type_project { "Apartment" }
    city { "Cali" }
    address { Faker::Address.street_address }
    price { 234352 }
    area { 50 }
    subsidy { Faker::Boolean.boolean }
    restroom { 2 }
    parking { Faker::Boolean.boolean }
    list_emails { ["oscar.info@vecindario.com", "racso1607@gmail.com"] }
    user
  end
end
