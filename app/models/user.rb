class User < ApplicationRecord
    has_secure_password
  
    validates :username, uniqueness: true, presence: true
    validates :password, presence: true, length: { minimum: 1 }, if: -> { new_record? || !password.nil? }
    validates :password_confirmation, presence: true, if: -> { password.present? }
  end