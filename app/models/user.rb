class User < ApplicationRecord
  has_many :projects

  validates :name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :auth_token,
            length: { minimum: 8 },
            if: -> { new_record? || !password.nil? }

  after_initialize :generate_auth_token

  def generate_auth_token
    # User.new
    unless auth_token.present?
      self.auth_token = TokenGenerationService.generate
    end
  end

end
