# spec/factories/posts.rb
FactoryBot.define do
  factory :post do
    title { "Sample Title" }
    content { "Sample Content" }
    status { "published" }
    author { "Sample Author" }
    association :user
  end
end
