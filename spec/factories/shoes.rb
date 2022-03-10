FactoryBot.define do
  factory :shoe do
    manufacturer_id  { '2' }
    color_id  { '2' }
    inout_id  { '2' }
    title  { 'test' }
    explanation  { 'test' }

    association :user
    after(:build) do |shoe|
      shoe.image.attach(io: File.open('public/images/shoes_basket_shoes.png'), filename: 'shoes_basket_shoes.png')
    end
  end
end