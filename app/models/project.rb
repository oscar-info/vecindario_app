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
  validates :subsidy, inclusion: { in: [true, false]}
  validates :restroom, presence: true
  validates :parking, inclusion: { in: [true, false]}
  validates :list_emails, presence: true
  validates :user_id, presence: true
end
