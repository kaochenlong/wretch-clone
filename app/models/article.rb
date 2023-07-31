# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  sub_title  :string
#  user_id    :integer
#  password   :string
#
class Article < ApplicationRecord
  validates :title, presence: true

  belongs_to :user
  has_many :comments

  has_many :like_logs
  has_many :users, through: :like_logs
end
