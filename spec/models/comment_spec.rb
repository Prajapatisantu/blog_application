require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { create(:user) }  
  let(:post) { create(:post, user: user) }  

  it "is valid with valid attributes" do
    comment = create(:comment, user: user, commentable: post)
    expect(comment).to be_valid
  end

  it "is not valid without content" do
    comment = build(:comment, content: nil, user: user, commentable: post)
    expect(comment).to_not be_valid
  end

  it "is not valid without a user" do
    comment = build(:comment, user: nil, commentable: post)
    expect(comment).to_not be_valid
  end

  it "is not valid without a commentable" do
    comment = build(:comment, user: user, commentable: nil)
    expect(comment).to_not be_valid
  end

  it "belongs to a user" do
    association = described_class.reflect_on_association(:user)
    expect(association.macro).to eq :belongs_to
  end

  it "belongs to a commentable (polymorphic association)" do
    association = described_class.reflect_on_association(:commentable)
    expect(association.macro).to eq :belongs_to
    expect(association.options[:polymorphic]).to be true
  end

end
