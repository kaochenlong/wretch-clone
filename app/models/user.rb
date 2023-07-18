class User < ApplicationRecord
  validates :password, confirmation: true

  validates :email, presence: true,
                    uniqueness: true,
                    format: {
                      with: URI::MailTo::EMAIL_REGEXP,
                      message: '格式有誤'
                    }

  before_create :encrypt_password

  private
  def encrypt_password
    self.password = Digest::SHA1.hexdigest(self.password)
  end
end
