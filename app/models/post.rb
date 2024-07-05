class Post < ApplicationRecord
  enum status: { draft: 0, published: 1 }

  has_many :comments, as: :commentable, dependent: :destroy
  has_one_attached :image
  has_one_attached :video

  validates :title, :content, :status, :author, presence: true

  before_create :set_creation_date
  before_save :set_published_date
  
  scope :published, -> { where(status: 'published') }
  scope :draft, -> { where(status: 'draft') }

  private

  def set_creation_date
    self.creation_date = Time.current
  end

  def set_published_date
    if status_changed? && status == "published"
      self.published_date = Time.current
    end
  end
end
