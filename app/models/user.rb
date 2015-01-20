class User < ActiveRecord::Base
  validates :username, presence: true
  has_many :ideas
  has_secure_password

  enum role: %w(default admin)
end
