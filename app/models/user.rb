class User < ApplicationRecord
  validates :email, presence: true,
                    uniqueness: true,
                    format: {
                      with: URI::MailTo::EMAIL_REGEXP,
                      message: '格式有誤'
                    }
end
