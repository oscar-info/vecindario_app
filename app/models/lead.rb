class Lead < ApplicationRecord
  belongs_to :project

  validates :name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone, presence: true, :phone_number => {:format => /\A[+][(]{0,1}[5][7][)]{0,1}[-\s\.\/0-9]*$/, :message => "Invalid number, example: +573002348465"}
  validates :project_id, presence: true
end
