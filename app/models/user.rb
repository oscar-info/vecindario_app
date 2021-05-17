class User < ApplicationRecord
  has_many :projects

  validates :name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :auth_token, presence: true
end
