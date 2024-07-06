require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'validates presence of title' do
    post = Post.new(title: nil)
    expect(post).to_not be_valid
    expect(post.errors[:title]).to include("can't be blank")
  end

  it 'validates presence of content' do
    post = Post.new(content: nil)
    expect(post).to_not be_valid
    expect(post.errors[:content]).to include("can't be blank")
  end

  it 'validates presence of status' do
    post = Post.new(status: nil)
    expect(post).to_not be_valid
    expect(post.errors[:status]).to include("can't be blank")
  end

  it 'validates presence of author' do
    post = Post.new(author: nil)
    expect(post).to_not be_valid
    expect(post.errors[:author]).to include("can't be blank")
  end

  it 'validates presence of associated user' do
    post = Post.new(title: 'Sample Title', content: 'Sample Content', status: 'published', author: 'Sample Author')
    expect(post).to_not be_valid
    expect(post.errors[:user]).to include("must exist")
  end

  it 'is valid with valid attributes' do
    user = create(:user) 
    post = build(:post, user: user)
    expect(post).to be_valid
  end

end
