class User < ApplicationRecord
  has_many :projects

  has_secure_password

  validates :name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password,
            length: { minimum: 8 },
            if: -> { new_record? || !password.nil? }

end
