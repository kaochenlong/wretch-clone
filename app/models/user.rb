class User < ApplicationRecord
  # callbacks
  before_create :encrypt_password

  # relationships
  has_many :articles
  has_many :comments

  # validations
  validates :password, confirmation: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: {
                      with: URI::MailTo::EMAIL_REGEXP,
                      message: '格式有誤'
                    }


  # class methods
  def self.login(email, password)
    return nil if email.empty? or password.empty?

    password = "x#{password}y".reverse
    password = Digest::SHA1.hexdigest(password)

    find_by email:, password:
  end

  private
  def encrypt_password
    pw = "x#{self.password}y".reverse
    self.password = Digest::SHA1.hexdigest(pw)
  end
end
