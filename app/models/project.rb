class Project < ApplicationRecord
  belongs_to :user
  has_many :lead

  serialize :list_emails, Array
end
