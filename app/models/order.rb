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
  include AASM
  belongs_to :user

  before_create :set_num

  aasm column: 'status', no_direct_assignment: true do
    state :pending, initial: true
    state :paid, :cancelled, :failed

    event :pay do
      transitions from: :pending, to: :paid
    end

    event :cancel do
      transitions from: [:pending, :paid], to: :cancelled
    end

    event :fail do
      transitions from: :pending, to: :failed
    end
  end

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
