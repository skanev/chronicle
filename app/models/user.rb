class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :products
  has_many :recipes

  normalizes :email_address, with: -> e { e.strip.downcase }
end