# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  num        :string
#  name       :string
#  tel        :string
#  solution   :string
#  user_id    :integer          not null
#  amount     :integer
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Order < ApplicationRecord
  belongs_to :user

  before_create :set_num

  private

  def set_num
    self.num = num_generator
  end

  # format: 20230741-XAB2DE
  def num_generator
    d = Time.now.strftime('%Y%m%d')
    r = SecureRandom.alphanumeric(6).upcase

    "#{d}-#{r}"
  end
end

    #  status     :string
    # pending
    # paid
    # cancelled
    # failed
