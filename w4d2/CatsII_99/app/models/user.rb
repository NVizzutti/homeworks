# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  user_name       :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  validates :user_name, :password_digest, :session_token, presence: true
  # validates :password, length: { minimum: 8 }, allow_nil: true
  after_initialize :ensure_token

  has_many :cats,
    class_name: :Cat,
    primary_key: :id,
    foreign_key: :user_id

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save
    self.session_token
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64(64)
  end

  def self.find_by_session_token(session_token)
    user = User.find_by(session_token: session_token)
  end

  def self.find_by_credentials(user_name, password)
    user = User.find_by(user_name: user_name)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def ensure_token
    self.session_token ||= self.class.generate_session_token
  end
end
