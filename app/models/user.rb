class User < ApplicationRecord
  # callbacks
  before_create :encrypt_password

  # relationships
  has_many :articles
  has_many :comments
  has_many :albums

  has_many :like_logs
  has_many :liked_articles, through: :like_logs, source: :article

  # validations
  validates :password, confirmation: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: {
                      with: URI::MailTo::EMAIL_REGEXP,
                      message: '格式有誤'
                    }

  # instance methods
  def toggle_like(record)
    if liked?(record)
      unlike!(record)
      return false
    else
      like!(record)
      return true
    end
  end

  def liked?(record)
    liked_articles.include?(record)
  end

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

  def like!(record)
    liked_articles << record
  end

  def unlike!(record)
    liked_articles.destroy(record)
  end
end
