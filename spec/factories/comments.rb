FactoryBot.define do
  factory :comment do
    content { 'Sample Comment Content' }
    association :commentable, factory: :post  
    association :user, factory: :user 
  end
end
