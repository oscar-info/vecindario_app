class User < ApplicationRecord
  has_many :projects

  has_secure_password

  validates :name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true, :phone_number => {:format => /\A[+][(]{0,1}[5][7][)]{0,1}[-\s\.\/0-9]*$/, :message => "Invalid number, example: +573002348465"}
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password,
            length: { minimum: 8 },
            if: -> { new_record? || !password.nil? }

end
