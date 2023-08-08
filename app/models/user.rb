class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates_presence_of :password_digest
  # password_confirmation?
  # api_key?
end
