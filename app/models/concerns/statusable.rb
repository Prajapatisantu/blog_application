# app/models/concerns/statusable.rb
module Statusable
  extend ActiveSupport::Concern

  included do
    enum status: { draft: 0, published: 1 }
    scope :published, -> { where(status: 'published') }
    scope :draft, -> { where(status: 'draft') }
  end
end
