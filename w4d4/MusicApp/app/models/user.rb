class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, allow_nil: true
  validate :ensure_session_token

  attr_reader :password

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
    @password = password
  end
  def generate_session_token
     SecureRandom.urlsafe_base64(16)
  end

  def ensure_session_token
    self.session_token ||= generate_session_token
  end

  def reset_session_token!
    self.session_token = generate_session_token
    self.save!
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    if user && BCrypt::Password.new(user.password_digest).is_password?(password)
      return user
    else
      return nil
    end
  end

end
