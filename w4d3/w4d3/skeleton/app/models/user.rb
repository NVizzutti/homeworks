class User < ActiveRecord::Base
  before_validation :ensure_session_token
  validates :user_name, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, allow_nil: true  #Password allowing < 6 letters
  validates :password_digest, :session_token, presence: true
  attr_reader :password

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(user_name, password)
    user = User.find_by(user_name: user_name)
    return nil if user.nil?
    if user.is_password?(password)
      return user
    end
    nil
  end

end
