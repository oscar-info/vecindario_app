class Project < ApplicationRecord
  belongs_to :user
  has_many :leads

  serialize :list_emails, Array

  validates :name_project, presence: true
  validates :type_project, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :area, presence: true
  validates :subsidy, presence: true
  validates :restroom, presence: true
  validates :parking, presence: true
  validates :list_emails, presence: true
  validates :user_id, presence: true
end
