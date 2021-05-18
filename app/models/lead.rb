class Lead < ApplicationRecord
  belongs_to :project

  validates :name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :creation_date, presence: true
  validates :project_id, presence: true
end
