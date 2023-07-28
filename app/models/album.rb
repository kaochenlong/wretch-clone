class Album < ApplicationRecord
  has_many_attached :photos do |attachable|
    attachable.variant :small, resize_to_limit: [100, 100]
  end

  belongs_to :user

  validates :name, presence: true
end
