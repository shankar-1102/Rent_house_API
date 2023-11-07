FactoryBot.define do

 
  factory :house do
    name { '5 BHK fully-furnished' }
    location { 'Indore' }
    price_for { :rent_price }
    available_for { :rent }
    status { :available }
    amount { 450000 }
    image_url { 'https://example.com/image.jpg' }
  end
 
  factory :user do
    email { "user@example.com" }
    password { '123456' }
    role {:user}

    trait :owner do
      role { 'owner' }
    end

    trait :admin do
      role { 'admin' }
    end
  end
  
  factory :feedback do
    feedback { 'great structure and beautiful ambience' }
    rating { 5 }
  end 
end
