# == Schema Information
#
# Table name: albums
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  password    :string
#  user_id     :integer          not null
#  deleted_at  :datetime
#  online      :boolean          default(TRUE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Album < ApplicationRecord
  has_many_attached :photos do |attachable|
    attachable.variant :small, resize_to_limit: [100, 100]
  end

  belongs_to :user

  validates :name, presence: true
end
