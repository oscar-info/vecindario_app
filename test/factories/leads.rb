FactoryBot.define do
  factory :lead do
    name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.cell_phone }
    creation_date { "2021-05-20" }
    project
  end
end
