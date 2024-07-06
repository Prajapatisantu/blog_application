class Post < ApplicationRecord
  include Statusable

  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :user
  has_one_attached :image
  has_one_attached :video

  validates :title, :content, :status, :author, presence: true

  before_create :set_creation_date
  before_save :set_published_date

  validate :video_content_type

  private

  def set_creation_date
    self.creation_date = Time.current
  end

  def set_published_date
    if status_changed? && status == "published"
      self.published_date = Time.current
    end
  end

  def video_content_type
    if video.attached? && !video.content_type.in?(%w(video/mp4))
      errors.add(:video, 'must be a valid MP4 file')
    end
  end
end
