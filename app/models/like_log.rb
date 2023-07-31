# == Schema Information
#
# Table name: like_logs
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  article_id :integer          not null
#
class LikeLog < ApplicationRecord
  belongs_to :user
  belongs_to :article
end
