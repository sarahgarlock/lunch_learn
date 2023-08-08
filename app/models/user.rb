class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }

  # before_create :generate_api_key

  private

  # def generate_api_key
  #   loop do
  #     self.api_key = SecureRandom.base58(24)
  #     break unless User.exists?(api_key: api_key)
  #   end
  # end
end
